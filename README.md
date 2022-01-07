# toggl-sync-status-check

Togglのデータがちゃんと入っているかチェックするスクリプト

## 使い方
### ローカルの場合
#### 環境変数の設定
```bash
$ cp .env.sample .env
$ vim .env
```

#### 実行
```bash
$ bundle install
$ bundle exec ruby app.rb
:ok
```

### GitHub Actionsの場合
#### 環境変数の設定
[Settings] -> [Sectets]に以下を登録
- TOGGL_API_TOKEN: Togglのtoken
- TOGGL_WORKSPACE_ID: Togglのworkspace id
