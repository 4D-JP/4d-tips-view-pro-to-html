//%attributes = {"invisible":true}
#DECLARE($name : Text)->$value : Variant

var $code : cs:C1710.Code

$code:=cs:C1710.Code.new($name)

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

$value:=$code.eval(Is text:K8:3)