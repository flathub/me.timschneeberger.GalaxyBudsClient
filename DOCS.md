Create sources.json files using [flatpak-dotnet-generator.py](https://raw.githubusercontent.com/flatpak/flatpak-builder-tools/master/dotnet/flatpak-dotnet-generator.py).
See also https://docs.flatpak.org/en/latest/dotnet.html.

Apply the SDK roll-forward patch to the source checkout before generating the
NuGet sources. This allows the .NET 10 SDK feature band provided by Flathub.

```
git -C ../GalaxyBudsClient apply "$PWD/dotnet-sdk-rollforward.patch"
python flatpak-dotnet-generator.py --freedesktop 26.08 --runtime linux-x64 --dotnet 10 sources-x64.json --only-arches x86_64 ../GalaxyBudsClient/GalaxyBudsClient/GalaxyBudsClient.csproj
python flatpak-dotnet-generator.py --freedesktop 26.08 --runtime linux-arm64 --dotnet 10 sources-arm64.json --only-arches aarch64 ../GalaxyBudsClient/GalaxyBudsClient/GalaxyBudsClient.csproj
```
