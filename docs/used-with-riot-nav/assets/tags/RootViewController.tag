<RootViewController>
<style>
.body{
    width: 100%;
    height: 100%;
    background-color: burlywood;
    position: absolute;
}
</style>

<!-- View -->
<div class="body">
    <h1>{ opts.title }</h1>
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
self.on("mount",function(){
    console.log("mount")
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

self.pushView = function(){
    self.opts.navigationController.push("subviewcontroller")
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

</RootViewController>