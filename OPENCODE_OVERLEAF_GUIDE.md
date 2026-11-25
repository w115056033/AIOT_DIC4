# OpenCode 連接 Overleaf 操作指南

本文件說明如何在 OpenCode 中連接到 Overleaf，並取得及上傳修改後的 LaTeX 檔案。**所有範例均使用佔位符，請勿填入真實的 API Key、專案 ID 或個人憑證。**

---

## 1. 前置作業

在開始之前，請確認你已準備好：

| 項目 | 說明 |
|------|------|
| Overleaf 帳號 | 已註冊並可登入 Overleaf 專案 |
| OpenCode 環境 | 已安裝並可正常啟動 OpenCode |
| 網路連線 | 可存取 Overleaf API 端點 |
| 認證資訊 | Overleaf API Key 與專案 ID（請以環境變數或本地設定檔管理，勿直接寫入程式碼）|
| Overleaf CLI | 已安裝 `overleaf cli` 工具（用於指令列下載與上傳檔案）|

---

## 2. 安全原則（重要）

為避免洩漏機密資訊，請遵守以下原則：

- **不要將 API Key、Token 或專案 ID 直接寫在 Markdown、腳本或程式碼中**
- 使用環境變數（例如 `.env`）或 OpenCode 的本地設定儲存認證資訊
- 提交版本控制前，務必檢查是否誤將金鑰檔納入追蹤
- 本文件所有 `< >` 括號內的文字皆為**範例佔位符**，請自行替換為你的實際值，且不要分享給他人

---

## 3. 取得 Overleaf 認證資訊

在 Overleaf 網頁介面中：

1. 登入你的 Overleaf 帳號
2. 前往 **Account Settings → API Keys**
3. 建立一組新的 API Key（或複製現有的）
4. 記下你要操作的 **專案 ID（Project ID）**，通常出現在專案網址中

> 🔒 將上述資訊儲存在本地安全位置，例如 `.env` 檔案，不要上傳到公共儲存庫。

範例 `.env` 結構（僅供參考，請自行建立）：

```env
OVERLEAF_API_KEY=<YOUR_API_KEY>
OVERLEAF_PROJECT_ID=<YOUR_PROJECT_ID>
```

---

## 4. 在 OpenCode 中連接 Overleaf

OpenCode 可透過 MCP（Model Context Protocol）伺服器或直接呼叫 Overleaf API 與 Overleaf 互動。以下為一般操作流程：

### 步驟 4.1：設定 MCP 伺服器（若適用）

如果你使用的是 Overleaf 相關的 MCP 伺服器，請在 OpenCode 設定中加入伺服器資訊：

```json
{
  "mcpServers": {
    "overleaf": {
      "command": "npx",
      "args": ["-y", "overleaf-mcp-server"],
      "env": {
        "OVERLEAF_API_KEY": "<YOUR_API_KEY>"
      }
    }
  }
}
```

> 實際指令與參數請依你安裝的 MCP 伺服器文件為準。

### 步驟 4.2：確認連線狀態

在 OpenCode 對話框中測試連線，例如：

```
請列出我 Overleaf 帳號下的所有專案
```

若回傳專案清單，即代表連線成功。

### 步驟 4.3：使用 overleaf cli（可選）

若你偏好透過指令列直接操作，可以安裝並使用 **overleaf cli**。在終端機中執行登入與設定專案：

```bash
overleaf login
overleaf init <PROJECT_ID>
```

登入成功後，即可使用 `overleaf download` 與 `overleaf upload` 指令來同步檔案，與 OpenCode 的 MCP 方式互補使用。

---

## 5. 取得檔案（從 Overleaf 下載）

### 步驟 5.1：列出專案內容

向 OpenCode 發出請求，取得指定專案的檔案清單：

```
請列出 Overleaf 專案 <PROJECT_ID> 中的所有檔案
```

### 步驟 5.2：下載特定檔案

若要取得主 LaTeX 檔或圖片、參考文獻等檔案內容：

```
請下載 Overleaf 專案 <PROJECT_ID> 中的 main.tex 檔案內容
```

OpenCode 會將檔案內容顯示在對話中，或直接儲存到你的本地工作目錄。

> 💡 若你已安裝 **overleaf cli**，也可直接在終端機下載：
> ```bash
> overleaf download <PROJECT_ID>
> ```

---

## 6. 本地修改檔案

取得檔案後，你可以在本地編輯器或直接在 OpenCode 中修改內容，例如：

- 修改 LaTeX 語法
- 新增章節或圖表
- 更新參考文獻
- 修正編譯錯誤

修改完成後，請先在本地確認檔案可正常編譯（例如使用 `pdflatex` 或 Overleaf 編譯器），再進行上傳。

---

## 7. 上傳修改後的檔案（回傳到 Overleaf）

### 步驟 7.1：上傳單一檔案

將修改後的檔案上傳回 Overleaf 專案：

```
請將本地 main.tex 上傳到 Overleaf 專案 <PROJECT_ID>，覆蓋原有檔案
```

### 步驟 7.2：上傳多個檔案或資料夾

若有多個檔案需要更新，可分批或一次性上傳：

```
請將本地的 figures/ 資料夾內所有圖片上傳到 Overleaf 專案 <PROJECT_ID>
```

### 步驟 7.3：確認上傳結果

上傳完成後，建議回到 Overleaf 網頁介面確認：

1. 開啟對應專案
2. 檢查檔案最後修改時間是否為剛才的上傳時間
3. 嘗試編譯，確認無誤

> 💡 若你已安裝 **overleaf cli**，也可直接在終端機上傳：
> ```bash
> overleaf upload <PROJECT_ID> main.tex
> ```

---

## 8. 常見工作流程範例

以下是一個完整的「取得 → 修改 → 上傳」流程範例（請將 `<PROJECT_ID>` 替換為你的專案 ID）：

1. **取得檔案**
   ```
   請下載 Overleaf 專案 <PROJECT_ID> 的 main.tex 到本地
   ```

2. **本地修改**
   在編輯器中修改 `main.tex`，例如新增一節：
   ```latex
   \section{實驗結果}
   本節說明實驗數據與分析。
   ```

3. **上傳修改**
   ```
   請將修改後的 main.tex 上傳到 Overleaf 專案 <PROJECT_ID>
   ```

4. **確認編譯**
   回到 Overleaf 網頁點擊 Recompile，確認 PDF 無誤。

---

## 9. 注意事項

| 事項 | 說明 |
|------|------|
| 檔案衝突 | 若多人同時編輯，上傳前請先在 Overleaf 確認最新版本，避免覆蓋他人修改 |
| 檔案大小 | 單一檔案或總上傳大小若過大，可能受 API 限制，請分批處理 |
| 權限設定 | 確保你的 API Key 有該專案的讀寫權限 |
| 暫存檔 | 不要上傳 `.aux`、`.log`、`.pdf` 等編譯暫存檔，除非有特殊需求 |

---

## 10. 參考資源

- [Overleaf API 文件](https://www.overleaf.com/learn)
- [OpenCode 官方文件](https://opencode.dev/)
- [MCP 伺服器規格](https://modelcontextprotocol.io/)
- [overleaf cli](https://github.com/overleaf/overleaf-cli) —— 指令列工具，用於下載與上傳 Overleaf 專案檔案

---

> 🔒 **提醒**：本文件僅作為操作指南範例，所有 `<YOUR_API_KEY>`、`<PROJECT_ID>` 等為佔位符，請勿在公開場合分享你的真實認證資訊。