FROM mcr.microsoft.com/dotnet/core/runtime:3.1

WORKDIR /app

COPY master/Published/ .

EXPOSE 5001/tcp
ENV ASPNETCORE_URLS http://*:5001

ENTRYPOINT ["dotnet", "Morsley.UK.Walking.Skeleton.API.dll", "--no-launch-profile"]