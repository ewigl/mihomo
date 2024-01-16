#### Mihomo 配置

[Mihomo](https://github.com/MetaCubeX/mihomo), Windows Tun 模式

[Box4Magisk](https://github.com/CHIZI-0618/box4magisk), Android Tproxy 模式

[Mihomo Docs](https://wiki.metacubex.one/config/), 参考文档

**目录结构:**

- box4magisk
- custom-rules - 自定义规则
- metacubexd - [Metacubexd](https://github.com/metacubex/metacubexd)

  ···

- mihomo.startup.vbs - .VBS 脚本，静默启动用
- Mihomo StartUp.xml - Windows 任务计划程序的备份文件
- update-geo-files.bat - 更新 geo 数据文件
- update-metacubexd.bat - 更新控制台

**Windows Tun 模式使用:**

1. 使用 git 克隆仓库， 或点击 Code -> Download ZIP， 解压缩。
2. 按需修改 `config.yaml` 中的 `proxy-groups`, `proxy-providers` 等配置。
3. 修改 `mihomo.startup.vbs` 中的 Mihomo 内核路径。
4. 按需修改 `update-geo-files.bat` 、 `update-metacubexd.bat` 中的路径。
5. 修改 `mihomo-windows-amd64.exe` 的兼容性设置，勾选“以管理员权限身份运行此程序”。
6. 双击 `mihomo.startup.vbs` 运行，允许管理员权限
7. 控制台：[http://localhost:9090/ui](http://localhost:9090/ui)

**Windows 开机自启且跳过管理员用户账户控制：**

1. 打开 Windows 任务计划程序
2. 导入 `Mihomo StartUp.xml`，或新建一个任务来开机运行 `mihomo.startup.vbs`.
3. 按需修改任务名称、文件路径、触发器、条件等等。
4. 在“常规”选项卡中， 勾选“使用最高权限运行”，Done。

**结束 Mihomo:**

任务管理器，终止 `mihomo-windows-amd64.exe`.

或使用管理员权限运行 `mihomo.stop.bat`。

**box4magisk 使用方法:**

0.  刷入 box4magisk，无需重启。
1.  按需修改 `box4magisk/clash/config.yaml` 中的 `proxy-groups`, `proxy-providers` 等配置。
2.  复制 `box4magisk` 中的文件到 `/data/adb/box`.
3.  复制 `custom-rules`, `metacubexd`, `(proxies)`, `GeoIP.dat`, `GeoSite.dat` 到 `/data/adb/box/calsh`.
4.  重启

**预览:**

![Preview](https://raw.githubusercontent.com/ewigl/mihomo/main/images/0.png)
