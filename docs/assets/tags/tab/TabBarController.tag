<TabBarController>

<!-- View -->
<div id="views">
</div>

<!-- Controller -->
<script>
// -----------
// private properties
// -----------
var self = this
var tags = [] // not self.tags

// -----------
// lifecycle of riot
// -----------
self.on("mount",function(){
    if ( self.opts.tabs != null && self.opts.tabs instanceof Array){
        for ( var i = 0; i < self.opts.tabs.length; i++ ){
            addTabViewController( self.opts.tabs[i].tagName , self.opts.tabs[i].opts )
        }
    }
})

self.on("unmount",function(){
    tags.map( function( tag ){ tag.unmount() })
})

// -----------
// public
// -----------
var tabBarControllerPublic = {

    selectedIndex: function(){
        return selectedIndex()
    },
    setSelectedIndex : function( index ){
        setSelectedIndex( index )
    }
}

// -----------
// private
// -----------
var addTabViewController = function( tagName, opts ){
    var views = document.getElementById("views")

    // create new viewcontroller's element
    var view = document.createElement("div")

    // Add initial class
    view.classList.add("view")
    var isFirst = (views.children.length == 0)
    if( !isFirst ){
        view.classList.add("inactive-view")
    }
    
    // Add element in ViewStack
    views.appendChild( view )

    // Create opt
    var options = {}
    if ( opts instanceof Object ){ options = opts }
    options.tabBarController = tabBarControllerPublic
    options.tab = tabBarControllerPublic

    // Mount tag for element
    view.setAttribute("data-is", tagName)
    let tag = riot.mount( tagName , options )[0]
    tags.push(tag)
}

var selectedIndex = function(){
    var views = document.getElementById("views")
    for( var i = 0; i < views.children.length; i++ ){
        if( !views.children[i].classList.contain("inactive-view") ) { return i }
    }
}

var setSelectedIndex = function( index ){
    var views = document.getElementById("views")
    for( var i = 0; i < views.children.length; i++ ){
        var view = views.children[i]
        if( i == index ){ view.classList.remove("inactive-view") }
        else { view.classList.add("inactive-view") }
    }
}

</script>

<!-- Style -->
<style>
#views {
    width: 100%;
    height: 100%;
    position: relative;
    overflow: hidden;
    box-sizing: border-box;
}
.view {
    width: 100%;
    height: 100%;
    position: absolute;
}
.inactive-view {
    display: none;
}
</style>

</TabBarController>