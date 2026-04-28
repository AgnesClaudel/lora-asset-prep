; LoRA Asset Prep - Inno Setup 6
; 若编译仍失败：请用 Inno 的「另存为」将本文件存为「UTF-8 带签名(BOM)」
; 再编译。PyInstaller: python -m PyInstaller --noconfirm --windowed --name lora-asset-prep app.py

#define MyAppName "LoRA Asset Prep"
#define MyAppVersion "1.0.0"
#define MyAppPublisher "AgnesClaudel"
#define MyAppExeName "lora-asset-prep.exe"
#define BuildDir "..\dist\lora-asset-prep"

[Setup]
AppId={{7F3A9C2E-1B4D-4E6F-8A0C-2D4E6F8A0B1C}}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
DefaultDirName={localappdata}\Programs\{#MyAppName}
DefaultGroupName={#MyAppName}
OutputDir=..\dist-installer
OutputBaseFilename=LoRA-Asset-Prep-Setup
Compression=lzma2
SolidCompression=yes
WizardStyle=modern
PrivilegesRequired=lowest
ArchitecturesInstallIn64BitMode=x64
DisableProgramGroupPage=no
; 多语言时：第一条 [Languages] 即默认向导；[Setup] 须用 「指令=值」 不能写成 「指令: 值」
ShowLanguageDialog=no

; 简体：使用与本 .iss 同目录下的 Languages\（已从 issrc Unofficial 随仓库提供，不要求本机 Inno 自带该文件）
[Languages]
Name: "chinesesimplified"; MessagesFile: "Languages\ChineseSimplified.isl"
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "在桌面创建快捷方式(&D)"; GroupDescription: "附加任务:"; Flags: unchecked

; [必须先有目录] 在项目根执行: python -m PyInstaller --noconfirm --windowed --name lora-asset-prep app.py
; 成功后才有 ..\dist\lora-asset-prep\ ，否则本节会报「未找到匹配的文件」。
[Files]
Source: "{#BuildDir}\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "安装完成后运行 {#MyAppName}"; Flags: nowait postinstall skipifsilent
