KISSY.Editor.add("separator",function(a){a.addPlugin("separator",function(){var b=(new KISSY.Node('<span class="ke-toolbar-separator">&nbsp;</span>')).appendTo(a.toolBarDiv);a.on("destroy",function(){b.remove()})},{duplicate:true})},{attach:false});