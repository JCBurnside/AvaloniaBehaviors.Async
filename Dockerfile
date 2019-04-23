FROM mcr.microsoft.com/dotnet/core-nightly/sdk:3.0 AS build
WORKDIR /AvaloniaBehaviors.Async

COPY . .
#COPY tests/**/*.csproj ./tests
COPY *.sln .
WORKDIR /AvaloniaBehaviors.Async
RUN dotnet restore
RUN dotnet build .

FROM build AS testrunner
WORKDIR /AvaloniaBehaviors.Async/tests
ENTRYPOINT [ "dotnet", "test" ]

FROM build AS run
WORKDIR /AvaloniaBehaviors.Async
ENTRYPOINT [ "./pack.sh" ]
