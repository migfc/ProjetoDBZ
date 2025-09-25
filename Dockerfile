# Etapa 1 - Build
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copiar csproj e restaurar dependências
COPY *.sln .
COPY */*.csproj ./
RUN for file in $(ls *.csproj); do mkdir -p ${file%.*} && mv $file ${file%.*}/; done
RUN dotnet restore

# Copiar todo o código
COPY . .

# Publicar em modo Release
RUN dotnet publish -c Release -o /app/publish

# Etapa 2 - Runtime
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
WORKDIR /app
COPY --from=build /app/publish .

# Variável de ambiente para ASP.NET
ENV ASPNETCORE_URLS=http://+:8080

# Expor porta
EXPOSE 8080

# Comando de inicialização
ENTRYPOINT ["dotnet", "ProjetoDBZ.dll"]
