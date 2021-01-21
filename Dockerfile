#FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build-env
#WORKDIR /app
#ADD . .
#RUN dotnet publish \
  #-c Release \
  #-o ./output
#FROM mcr.microsoft.com/dotnet/runtime:5.0
#WORKDIR /app
#COPY --from=build-env /app/output .
#EXPOSE 8000
#ENTRYPOINT VotingData.exe

FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build-env
WORKDIR /app
ADD . .
RUN dotnet publish \
 -c Release \
 -o ./output
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
WORKDIR /app
COPY --from=build-env /app/output .
EXPOSE 8000
ENTRYPOINT VotingData.exe