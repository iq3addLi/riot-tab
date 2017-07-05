<ThirdViewController>

<style>
.body{
    width: 100%;
    height: 100%;
    background-color: azure;
    position: absolute;
}
</style>

<!-- View -->
<div class="body">
    <h1>This view is ThirdViewController</h1>
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

self.onFirst = function(){
    self.opts.tabBarController.setSelectedIndex(0)
}

self.onSecond = function(){
    self.opts.tabBarController.setSelectedIndex(1)
}

self.onThird = function(){
    self.opts.tabBarController.setSelectedIndex(2)
}

// delegate
self.shouldSelect = function(){
    console.log("shouldSelect")
    return true
}

self.didSelect = function(){
    console.log("didSelect")
}
</script>

</ThirdViewController>