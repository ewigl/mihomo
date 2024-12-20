## Mihomo Tun 模式配置

> 直接运行内核。支持 Windows 和具有 root 权限的 Android。
>
> Web UI 默认密码为 `998486`。

### 完整文档

[![完整文档](https://img.shields.io/badge/完整文档-blue)](https://ewigl.github.io/notes/posts/programming/mihomo-tun-guide/)

### 准备

1. 下载 [mihomo](https://github.com/MetaCubeX/mihomo/releases) 内核。
2. 下载 [geoip.metadb](https://github.com/MetaCubeX/meta-rules-dat/releases) GeoIP 数据文件。
3. 下载 [metacubexd](https://github.com/MetaCubeX/metacubexd/releases) Web UI。
4. 【Android】下载 [Box for Root](https://github.com/taamarin/box_for_magisk/releases)。
5. 按照目录结构整理现有文件。

### 目录结构 - Windows

```
.
└── D:/Apps/Mihomo/
    ├── config.yaml
    ├── geoip.metadb
    ├── mihomo-windows-amd64.exe
    ├── mihomo.start.vbs
    ├── Mihomo.Startup.xml
    ├── mihomo.stop.bat
    ├── README.md
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

### 目录结构 - Android

```
.
└── /data/adb/box/
    ├── bin/
    │   └── xclash/
    │       └── mihomo
    └── clash/
        ├── metacubexd/
        ├── proxies/
        ├── ruleset/
        ├── config.yaml
        └── geoip.metadb
```

### 预览

![00](https://ewigl.github.io/notes/posts/programming/mihomo-tun-guide/images/00.png)

![01](https://ewigl.github.io/notes/posts/programming/mihomo-tun-guide/images/01.png)
