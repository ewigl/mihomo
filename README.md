#### Mihomo Config

[![CN](https://img.shields.io/badge/lang-zh-Hans)](https://github.com/ewigl/mihomo/blob/master/README.CN.md)

[Mihomo](https://github.com/MetaCubeX/mihomo), Windows Tun

[Box For Root](https://github.com/taamarin/box_for_magisk), Android Tun

[Mihomo Docs](https://wiki.metacubex.one/config/), for reference

**Dirs:**

- box_for_root
- custom-rules
- metacubexd - [Metacubexd](https://github.com/metacubex/metacubexd)

  ···

- mihomo.startup.vbs - .VBS for silent start
- Mihomo StartUp.xml - Windows Task Scheduler backup file
- update-geo-files.bat
- update-metacubexd.bat

**Windows Tun Mode Usage:**

1. Click Code -> Download ZIP, then Extract.
2. Modify `proxy-groups`, `proxy-providers`, and maybe something else in `config.yaml`.
3. Change Mihomo's core path in `mihomo.startup.vbs`
4. Change paths in `update-geo-files.bat` 、 `update-metacubexd.bat`.
5. Modify `mihomo-windows-amd64.exe`'s compatiable settings, tick "admin permission".
6. Double click `mihomo.startup.vbs` to run, allow admin permission.
7. Controller dashboard：[http://localhost:9090/ui](http://localhost:9090/ui)

**Windows start up task and skip account control window:**

1. Open Windows Task Scheduler.
2. Import `Mihomo StartUp.xml`, or NEW a task to run `mihomo.startup.vbs`.
3. Change task's name, file path, triger, condition...
4. In "General/Common" tab, tick 'admin/higherst permission', save & done.

**End Mihomo:**

Open Task Manager, terminate `mihomo-windows-amd64.exe`.

or use `mihomo.stop.bat` with admin permission.

**Box For Root tun usage:**

0.  Flash box_for_root, no reboot.
1.  Modify `proxy-groups`, `proxy-providers`, and maybe something else in `box_for_root/clash/config.yaml`.
2.  Copy files from `box_for_root` to `/data/adb/box`.
3.  Copy `custom-rules`, `metacubexd`, `(proxies)`, `GeoIP.dat`, `GeoSite.dat` to `/data/adb/box/calsh`.
4.  Reboot.

**Preview:**

![Preview](https://raw.githubusercontent.com/ewigl/mihomo/main/images/0.png)
