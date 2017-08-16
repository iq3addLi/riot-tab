<!--
/*!
 * A radio-style selection view manager for riot.js like UITabBarController in iOS. 
 * https://github.com/iq3addLi/riot-tab
 *
 * Copyright +Li, Inc.
 * Released under the MIT license
 * https://github.com/iq3addLi/riot-tab/blob/master/LICENSE
 *
 */
-->
<TabBarController>

<!-- View -->
<div id={ uniqueID() } class="riot-tag-views">
</div>

<!-- Controller -->
<script>
// -----------
// private properties
// -----------
var self = this
var tags = [] // not self.tags
var tab_id = undefined

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
self.selectedIndex = function(){
    return selectedIndex()
}
self.setSelectedIndex = function( index ){
    setSelectedIndex( index )
}
self.isActive = function( tag ){
    return tags[selectedIndex()] == tag
}
self.viewTags = function(){
    return tags
}

// internal function
self.uniqueID = function(){
    if( tab_id ) { return tab_id }
    tab_id = "riot-tab_" + uuidv4()
    return tab_id
}

// -----------
// private
// -----------
var addTabViewController = function( tagName, tabOptions ){
    var views = document.getElementById(self.uniqueID())

    // create new viewcontroller's element
    var view = document.createElement("div")
    view.id = "riot-tab-child_" + uuidv4()

    // Add initial class
    view.classList.add("riot-tag-view")
    var isFirst = (views.children.length == 0)
    if( !isFirst ){
        view.classList.add("riot-tag-inactive-view")
    }
    
    // Add element in ViewStack
    views.appendChild( view )

    // Create opt
    var options = {}
    if ( tabOptions instanceof Object ){ options = tabOptions }
    options.tabBarController = self
    options.tab = self

    // Mount tag for element
    view.setAttribute("data-is", tagName)
    let tag = riot.mount( "div#" + view.id, tagName , options )[0]
    tags.push(tag)
}

var selectedIndex = function(){
    var views = document.getElementById(self.uniqueID())
    for( var i = 0; i < views.children.length; i++ ){
        if( !views.children[i].classList.contains("riot-tag-inactive-view") ) { return i }
    }
}

var setSelectedIndex = function( index ){
    var selected = selectedIndex()
    if( index == selected ) return

    // Can select?
    var selectedTag = tags[selected]
    if( selectedTag.shouldSelect && selectedTag.shouldSelect() == false ) return

    // Deselect
    var views = document.getElementById(self.uniqueID())   
    views.children[selected]
         .classList.add("riot-tag-inactive-view")
    if( selectedTag.didDeselect ){ selectedTag.didDeselect() } 

    // Select
    views.children[index]
         .classList.remove("riot-tag-inactive-view")
    var tag = tags[index]
    if( tag.didSelect ) { tag.didSelect() }

}

var uuidv4 = function() {
  return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
    var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
    return v.toString(16);
  });
}

</script>

<!-- Style -->
<style>
.riot-tag-views {
    width: 100%;
    height: 100%;
    position: relative;
    overflow: hidden;
    box-sizing: border-box;
}
.riot-tag-view {
    width: 100%;
    height: 100%;
    position: absolute;
}
.riot-tag-inactive-view {
    display: none;
}
</style>

</TabBarController>