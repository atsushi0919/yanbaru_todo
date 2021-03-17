# やんばる教材チャレンジ問題
## 【クラス】ToDoリストプログラムを作ろう！


### 課題条件
- TaskクラスとToDoクラスを作成
- 各クラスごとにファイルを作成し，メインのファイルで読み込む形式とすること
- タスク（Task）は「ID（id）」「タイトル（title）」「内容（content）」の3つの情報を持つ
- タスクのIDは1から順番に振られる（タスクが削除された場合も続きからIDを振る）
- ToDoリストは，タスクの追加・一覧表示・削除の機能を持つ
- タスクの削除は，IDを指定して行う

### 開発環境
ruby 2.6.6

### プログラム実行方法
```
# チャレンジ課題と同じ動作を確認する場合
ruby main.rb

# マニュアル動作モード
ruby main.rb manual
```

### マニュアル動作モード時の仕様
- タスクの件名は入力必須となっています。
- タスクの件名文字数は10文字までとなっています。
- タスクの内容文字数は40文字までとなっています。
- マニュアル動作時は```q```キーか```CTRL+C```で終了することが出来ます。
