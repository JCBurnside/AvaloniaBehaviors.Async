#!/bin/bash
for file in src/**/*.csproj
do
	dotnet pack "$file" -o ./Artifacts --no-build
done
