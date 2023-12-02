#### Mihomo Config

[Mihomo](https://github.com/MetaCubeX/mihomo) Windows Tun

[Box4Magisk](https://github.com/CHIZI-0618/box4magisk) Android Tproxy

[Mihomo Docs](https://wiki.metacubex.one/config/)

**Dirs:**

- box4magisk
- custom-rules
- metacubexd - [Metacubexd](https://github.com/metacubex/metacubexd)

  ···

- mihomo.startup.vbs - silent start VBS
- Mihomo StartUp.xml - Windows Task Scheduler backup file
- update-geo-files.bat
- update-metacubexd.bat

**Usage:**

1. git clone repo, or Code -> Download ZIP and Extract。
2. modify `proxy-groups`, `proxy-providers` and also everything needed in `config.yaml`.
3. change Mihomo core file path in `mihomo.startup.vbs`
4. change dir paths in `update-geo-files.bat` 、 `update-metacubexd.bat`.
5. modify `mihomo-windows-amd64.exe`'s compatiable settings, tick "admin permission"。
6. db-click `mihomo.startup.vbs` to run, allow admin permission.
7. controller dashboard：[http://localhost:9090/ui](http://localhost:9090/ui)

**Windows start up task and skip account control window:**

1. Task Scheduler.
2. import `Mihomo StartUp.xml` or NEW a task to run `mihomo.startup.vbs`.
3. change name, file path, triger, condition and so on if needed.
4. in "General" tab, tick 'admin/higherst permission', save, done.

**End Task:**

in task manager, terminate `mihomo-windows-amd64.exe`.

**box4magisk usage**

0.  flash box4magisk, no reboot.
1.  modify `proxy-groups`, `proxy-providers` and also everything needed in `box4magisk/clash/config.yaml`.
2.  copy files from `box4magisk` to `/data/adb/box`.
3.  copy `custom-rules`, `metacubexd`, `(proxies)`, `GeoIP.dat`, `GeoSite.dat` to `/data/adb/box/calsh`.
4.  reboot.
