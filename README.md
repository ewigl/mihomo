## Mihomo Tun

文档:

[![EN](https://img.shields.io/badge/lang-en--US-blue)](https://ewigl.github.io/notes/en/posts/202404/mihomo-tun-guide/)
[![ZH](https://img.shields.io/badge/lang-zh--CN-green)](https://ewigl.github.io/notes/posts/202404/mihomo-tun-guide/)

### 前置:

1. 下载 [Mihomo Core](https://github.com/MetaCubeX/mihomo/releases)。
2. 在[这里](https://github.com/Loyalsoldier/v2ray-rules-dat/releases)下载 `GeoIP.dat` 、 `GeoSite.dat`。
3. 在[这里](https://github.com/MetaCubeX/metacubexd/releases)下载 `metacubexd`。
4. 仅 Android，需要[Box for Root](https://github.com/taamarin/box_for_magisk/releases)。

### 文件结构示例 Windows:

```
.
└── D:/Apps/Mihomo/
    ├── config.yaml
    ├── GeoIP.dat
    ├── GeoSite.dat
    ├── Mihomo StartUp.xml
    ├── mihomo-windows-amd64.exe
    ├── mihomo.startup.vbs
    ├── mihomo.stop.bat
    ├── README.md
    ├── updater.bat
    ├── custom-rules/
    │   ├── direct.yaml
    │   ├── proxy.yaml
    │   └── reject.yaml
    ├── metacubexd/
    │   ├── index.html
    │   └── ...
    ├── proxies/
    │   ├── Local.yaml
    │   └── ...
    └── ruleset/
        ├── proxy.yaml
        └── ...
```

### 文件结构示例 Android:

```
.
└── /data/adb/box/
    ├── bin/
    │   └── xclash/
    │       └── mihomo
    ├── clash/
    │   ├── config.yaml
    │   ├── GeoIP.dat
    │   └── GeoSite.dat
    ├── metacubexd/
    ├── proxies/
    └── ruleset/
```
