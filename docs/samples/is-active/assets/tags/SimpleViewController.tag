<SimpleViewController>

<style>
.view-in-viewtag{
    width: 100%;
    height: 100%;
    position: absolute;
}
</style>

<!-- View -->
<div class="view-in-viewtag">
    <h1>This view is { opts.title }ViewController</h1>
    Check JS console.<br/>
    <button each={ view,i in views  } onclick={ viewSwitch }>
        { view }
    </button>
</div>

<!-- Controller -->
<script>
var self = this

self.views = [ "first","second","third" ]
self.on("mount", function(){
    var views = document.getElementsByClassName("view-in-viewtag")
    var view = views[views.length - 1]
    view.style.backgroundColor = self.opts.backgroundColor
})

self.viewSwitch = function( obj ){
    self.opts.tab.setSelectedIndex( obj.item.i )
}

// delegate
self.didSelect = function(){
    self.opts.tab.viewTags().map(function( tag ){
        console.log( tag.opts.title + " view is " + (self.opts.tab.isActive( tag ) ? "active" : "inactive") )
    })
}

</script>

</SimpleViewController>