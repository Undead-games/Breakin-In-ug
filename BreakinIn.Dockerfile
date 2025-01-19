FROM mcr.microsoft.com/dotnet/sdk:2.1 as build

WORKDIR /App

COPY ./BreakinIn ./BreakinIn
COPY ./BreakinIn.sln ./BreakinIn.sln

RUN dotnet restore

RUN dotnet publish -o out

FROM mcr.microsoft.com/dotnet/aspnet:2.1

WORKDIR /App

COPY --from=build /App/BreakinIn/out .

ENTRYPOINT [ "dotnet", "BreakinIn.dll" ]