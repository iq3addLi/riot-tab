<SubViewController>
<style>
.body{
    width: 100%;
    height: 100%;
    background-color: aquamarine;
    position: absolute;
}
</style>

<!-- View -->
<div class="body">
    <h1>This view is SubViewController</h1>
    <button onclick={ pushView }>next</button>
    <button onclick={ popView }>back</button>
    <br />

    <button onclick={ onFirst }>first</button>
    <button onclick={ onSecond }>Second</button>
    <button onclick={ onThird }>Third</button>
</div>

<!-- Controller -->
<script>
var self = this

// riot lifecycle
self.on("mount",function(){
    console.log("mount")
})
self.on("unmount",function(){
    console.log("unmount")
})

// action
self.pushView = function(){
    self.opts.navigationController.push("endviewcontroller")
}
self.popView = function(){
    self.opts.navigationController.pop()
}
self.onFirst = function(){
    self.opts.nav.tab.setSelectedIndex(0)
}
self.onSecond = function(){
    self.opts.nav.tab.setSelectedIndex(1)
}
self.onThird = function(){
    self.opts.nav.tab.setSelectedIndex(2)
}

// nav controller lifecycle
self.didLoad = function(){
    console.log("did load.")
}
self.willAppear = function(){
    console.log("will appear.")
}
self.didAppear = function(){
    console.log("did appear.")
}
self.willDisappear = function(){
    console.log("will disappear.")
}
self.didDisappear = function(){
    console.log("did disappear.")
}

// tab controller lifecycle
self.shouldSelect = function(){
    console.log("shouldSelect")
    return true
}
self.didSelect = function(){
    console.log("didSelect")
}
self.didDeselect = function(){
    console.log("didDeselect")
}


</script>

</SubViewController>