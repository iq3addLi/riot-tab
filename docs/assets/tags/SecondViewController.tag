<SecondViewController>
<style>
#body{
    width: 100%;
    height: 100%;
    background-color: aquamarine;
    position: absolute;
}
</style>

<!-- View -->
<div id="body">
    <h1>This view is SecondViewController</h1>
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

</script>

</SecondViewController>