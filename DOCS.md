Create sources.json files using [flatpak-dotnet-generator.py](https://raw.githubusercontent.com/flatpak/flatpak-builder-tools/master/dotnet/flatpak-dotnet-generator.py).
See also https://docs.flatpak.org/en/latest/dotnet.html.

```
python flatpak-dotnet-generator.py --freedesktop 24.08  --runtime linux-x64 --dotnet 10 sources-x64.json --only-arches x86_64 ../GalaxyBudsClient/GalaxyBudsClient/GalaxyBudsClient.csproj 
python flatpak-dotnet-generator.py --freedesktop 24.08  --runtime linux-arm64 --dotnet 10 sources-arm64.json --only-arches arm64 ../GalaxyBudsClient/GalaxyBudsClient/GalaxyBudsClient.csproj 
```
