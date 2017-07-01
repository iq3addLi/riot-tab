# riot-tab
A radio-style selection view manager for riot.js like UITabBarController in iOS.

## How to use

### import tag
```html
<script type="riot/tag" src="path/to/TabBarController.tag"></script>
```
### mount with tags
Please note that you need to write with lowercase.
```html
<tabbarcontroller tabs={ [
    { tagName : "firstviewcontroller", opts : {} },
    { tagName : "secondviewcontroller", opts : {} },
    { tagName : "thirdviewcontroller", opts : {} }
] } />
```
#### with riot-nav
When used with [riot-nav](https://github.com/iq3addLi/riot-nav).
```html
<tabbarcontroller tabs={ [
    { tagName : "navigationcontroller", opts : { root : "firstviewcontroller" } },
    { tagName : "navigationcontroller", opts : { root : "secondviewcontroller" } },
    { tagName : "navigationcontroller", opts : { root : "thirdviewcontroller" } }
] } />
```

## Access
From the tag of the child you can refer from opts.tab
```js
opts.tab
opts.tabBarController // Familiar to iOS engineers
```

## API

### selectedIndex
return index of selected tag.
```js
tab.selectedIndex()
```

### setSelectedIndex
Changed to active.
```js
tab.setSelectedIndex(1)
```

## Demo
[View demo](https://iq3addli.github.io/riot-tab/index.html)

## Check list
|Browser|Version|OS|Result|
|:---|:---|:---|:---:|
|Safari|10.1.1|MacOSX Sierra|◯|
|FireFox|52.0.2|MacOSX Sierra|◯|
|Chrome|58.0.3029.110|MacOSX Sierra|◯|
