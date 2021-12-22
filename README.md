# 4d-tips-view-pro-to-html
4D View Proエリアの選択範囲をHTMLに変換する例題

#### 参考記事

* [Export Range to HTML](https://www.grapecity.com/spreadjs/docs/v14/online/export-range-to-html.html)

#### スクリーンショット

<img width="815" alt="html" src="https://user-images.githubusercontent.com/10509075/147018903-c9d1b6be-98bc-499e-99c0-d87c3442e50f.png">

#### 解説

Webエリアのコマンドを使用し，カスタムJavaScriptコードを4D View Proのコンテキストで実行します。

まず，文字列を連結する簡単なクラスを作成します。

```4d
Class constructor($name : Text; $lines : Collection)
	
	If ($lines=Null)
		$lines:=New collection
	End if 
	
	This.name:=$name
	This.lines:=$lines
	
Function add($line : Text)->$this : Object
	
	This.lines.push(String($line))
	
	$this:=This
	
Function code()->$code : Text
	
	$code:=This.lines.join("\r"; ck ignore null or empty)
	
Function clear()->$this : Object
	
	This.lines:=New collection
	
	$this:=This
	
Function eval($type : Integer)->$value : Variant
	
	$value:=WA Evaluate JavaScript(*; This.name; This.code(); $type)
```

これは任意です。文字列の連結操作やコマンドをそのまま実行しても構いません。

作成したクラスを使用し，カスタムJavaScriptコードを4D View Proのコンテキストで実行します。

```4d
#DECLARE($name : Text)->$value : Variant

var $code : cs.Code

$code:=cs.Code.new($name)

$code.add("(function(){")

$code.add("    let activeSheet = Utils.spread.getActiveSheet();")
$code.add("    let selectedRanges = activeSheet.getSelections();")
$code.add("    let r = selectedRanges[0].row;")
$code.add("    let rc = selectedRanges[0].rowCount;")
$code.add("    let c = selectedRanges[0].col;")
$code.add("    let cc = selectedRanges[0].colCount;")
$code.add("    let html = activeSheet.getRange(r, c, rc, cc).toHtml();")

$code.add("    return html;")

$code.add("}())")

$value:=$code.eval(Is text)
```



