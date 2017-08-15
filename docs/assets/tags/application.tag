<application>
    
<!-- View -->
<navigationbar title={ title } samples={ samples }/>

<div class="container" role="main" style="padding-top: 80px">

    <div class="jumbotron">
        <h1>{ title }</h1>
        <p>Radio-style selection view manager can be used in riot.js. Ideal for SPA.</p>
    </div>

    <div class="page-header">
        <h1>sample list</h1>
    </div>
    <section>
        <ul>
            <li each={ samples }>
                <a href={ url }>{ caption }</a>
            </li>
        </ul>
    </section>
</div>

<script>
var self = this

self.title = "riot-tab"
self.samples = [
    { caption : "minimal basic usage", url : "./samples/basic/index.html" },
    { caption : "used with riot-nav", url : "./samples/used-with-riot-nav/index.html" },
    { caption : "check active by child tag", url : "./samples/is-active/index.html" },
]

</script>

</application>
