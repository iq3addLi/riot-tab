<EndViewController>
<style>
#body{
    width: 100%;
    height: 100%;
    background-color: azure;
    position: absolute;
}
</style>

<!-- View -->
<div id="body">
    <h1>This view is EndViewController</h1>
    <button onclick={ popView }>back</button>
    <br />

    <button onclick={ onFirst }>first</button>
    <button onclick={ onSecond }>Second</button>
    <button onclick={ onThird }>Third</button>
</div>

<!-- Controller -->
<script>
var self = this
self.on("mount",function(){
    console.log("mount")
})
self.on("unmount",function(){
    console.log("unmount")
})

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

</script>

</EndViewController>