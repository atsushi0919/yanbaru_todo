# やんばる教材チャレンジ問題

## 【クラス】ToDo リストプログラムを作ろう！

### 課題条件

- Task クラスと ToDo クラスを作成
- 各クラスごとにファイルを作成し，メインのファイルで読み込む形式とすること
- タスク（Task）は「ID（id）」「タイトル（title）」「内容（content）」の 3 つの情報を持つ
- タスクの ID は 1 から順番に振られる（タスクが削除された場合も続きから ID を振る）
- ToDo リストは，タスクの追加・一覧表示・削除の機能を持つ
- タスクの削除は，ID を指定して行う

### 開発環境

開発: Ruby 3.0.0
確認: Ruby 2.6.3, 2.6.6, 2.7.2, 3.0.0

### ファイルの説明

- README.md ... このファイルです。
- main.rb ... 動作確認用のプログラムです。
- todo_app ... TodoApp クラスの定義ファイルです。
- task.rb ... Task クラスの定義ファイルです。
- todo.rb ... ToDo クラスの定義ファイルです。
- manual.rb ... Manual クラスの定義ファイルです。
- message_color.rb ... MessageColor モジュールの定義ファイルです。

### TodoApp クラスのメソッドについて

#### TodoApp#start

`start()`
手動入力画面が起動し、対話式で ToDo タスクの操作を行います。

例

```ruby
require "./todo_app"

todo_app = TodoApp.new
todo_app.start
```

#### TodoApp#execute

`execute(method:, params: {})`
第 1 引数にメソッド、第 2 引数にメソッドに対応したパラメータのハッシュを指定し、 Todo タスクの操作を行います。

例

```ruby
require "./todo_app"

todo_app = TodoApp.new
todo_app.execute(method: :add, params: { title: "洗濯", content: "7時までに干し終える" })
todo_app.execute(method: :add, params: { title: "仕事", content: "9時〜18時" })
todo_app.execute(method: :delete, params: { id: 1 })
todo_app.execute(method: :info)
```

### 動作確認プログラム(main.rb)の実行方法

```

# チャレンジ課題と同じ動作のデモを行う

ruby main.rb

# 手動入力モードでプログラムを起動する

ruby main.rb manual

```

### マニュアル動作モード時の仕様

- タスクの件名は入力必須となっています。
- タスクの件名文字数は 10 文字までとなっています。
- タスクの内容文字数は 40 文字までとなっています。
- マニュアル動作時は`q`キーか`CTRL+C`で終了することが出来ます。
