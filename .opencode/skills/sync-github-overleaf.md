# sync-github-overleaf

**觸發時機：** 當本專案 (`AIOT_DIC4`) 有任何檔案修改後，需要將變更同步推送到 GitHub 與 Overleaf 兩端。

**適用檔案：** `main2.tex`、`README.md`、`.olcli.json` 等專案來源檔。

## 用途

本 skill 用於在本地編輯完 LaTeX 原始碼或文件後，一次性將修改推送到：
1. **GitHub**：`https://github.com/w115056033/AIOT_DIC4.git`
2. **Overleaf**：透過 `olcli` 推送 `main2.tex` 到專案 `6b06bc71056e29946462642e`

## 前置條件

- 本地已安裝 `git`
- 本地已安裝 `olcli`（Overleaf CLI），並已登入
- GitHub 遠端已設定為 `origin`（指向 `https://github.com/w115056033/AIOT_DIC4.git`）
- Overleaf 專案 ID 為 `6b06bc71056e29946462642e`

## 同步步驟（手動）

### 步驟 1：推送到 GitHub

```bash
git add .
git commit -m "描述本次修改內容"
git push origin master
```

### 步驟 2：推送到 Overleaf

```bash
olcli push main2.tex --project 6b06bc71056e29946462642e
```

## 自動化腳本

專案根目錄提供 `sync-all.sh`（Linux/macOS）或 `sync-all.ps1`（Windows PowerShell），執行即可一次完成 GitHub 與 Overleaf 同步。

### 使用方式

```bash
# Linux/macOS
./sync-all.sh "你的 commit 訊息"

# Windows PowerShell
.\sync-all.ps1 "你的 commit 訊息"
```

腳本會依序：
1. `git add .`
2. `git commit -m "<訊息>"`
3. `git push origin master`
4. `olcli push main2.tex --project 6b06bc71056e29946462642e`

## 注意事項

- `main2.tex` 已移除 `xeCJK` 與所有中文字元，請使用 **pdfLaTeX** 編譯，不要使用 XeLaTeX。
- 若 Overleaf 推送失敗，請先確認 `olcli` 已登入：`olcli whoami`
- 若 GitHub 推送失敗，請確認遠端正確：`git remote -v`