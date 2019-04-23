for file in $(ls ./src/**/*.csproj) do
	dotnet pack $file -o ./Artifacts
done
