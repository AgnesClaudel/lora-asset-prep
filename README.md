# LoRA Image Prep — LoRA 图像预处理

上游仓库：**<https://github.com/AgnesClaudel/lora-asset-prep>**（仓库名 `lora-asset-prep`）。

基于 PySide6 的素材目录批处理：等比缩放、黑/白/透明补边、竖横分流尺寸、比例预设、排除目录、自动/手动模式；配置写入 `presets.json`。

## 环境

```powershell
python -m venv .venv
.\.venv\Scripts\activate
pip install -r requirements.txt
```

## 运行

```powershell
python app.py
```

## 打包 exe（可选）

```powershell
pip install pyinstaller
pyinstaller --noconfirm --onefile --windowed --name lora-asset-prep app.py
```

产物在 `dist\lora-asset-prep.exe`。

若 `pyinstaller` 命令报错，请用 `python -m PyInstaller ...`（同上参数）。

## 安装包（Setup.exe，可选）

「需要安装的 exe」一般指带安装向导、写入开始菜单/桌面、可在「应用和功能」里卸载的 **安装程序**。做法是：先用 PyInstaller 打出**目录版**（不要 `--onefile`），再用 [Inno Setup](https://jrsoftware.org/isdl.php) 打成 `Setup.exe`。

1. 安装 **Inno Setup 6**（免费）。
2. 在项目根目录执行（与单文件相比去掉 `--onefile`，得到 `dist\lora-asset-prep\` 文件夹）：

```powershell
python -m PyInstaller --noconfirm --windowed --name lora-asset-prep app.py
```

3. 用 Inno Setup 打开仓库里的 `installer\LoRA-Asset-Prep.iss`，菜单 **构建 → 编译**；或在 PowerShell 中（按本机安装路径调整）：

```powershell
& "${env:ProgramFiles(x86)}\Inno Setup 6\ISCC.exe" installer\LoRA-Asset-Prep.iss
```

4. 生成的安装包在 **`dist-installer\LoRA-Asset-Prep-Setup.exe`**，可发给别人双击安装。

`installer\LoRA-Asset-Prep.iss` 已按「UTF-8 带 BOM」方式保存。**简体中文向导**使用仓库内 `installer\Languages\ChineseSimplified.isl`（取自 [Inno issrc Unofficial](https://github.com/jrsoftware/issrc/tree/main/Files/Languages/Unofficial)），编译不要求本机在 `...\Inno Setup 6\Languages\` 下存在该文件。若你本地另存 `.iss` 后编译异常，可用 Inno **File → Save As → UTF-8 带签名** 再试。

版本号、安装目录等可在 `installer\LoRA-Asset-Prep.iss` 顶部的 `#define` 里改。`AppId` 的 GUID 请勿在发版后随意更换，否则 Windows 可能无法正确覆盖升级或卸载。

## 关联远程仓库（首次）

```powershell
git init
git remote add origin https://github.com/AgnesClaudel/lora-asset-prep.git
```
