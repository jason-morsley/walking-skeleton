FROM mcr.microsoft.com/dotnet/core/runtime:3.1

WORKDIR /app

COPY master/Published/ .

EXPOSE 7777/tcp
ENV ASPNETCORE_URLS http://*:7777

ENTRYPOINT ["dotnet", "JasonMorsley.Dev.WalkingSkeleton.API.dll", "--no-launch-profile"]