# riot-tab
A radio-style selection view manager for riot.js like UITabBarController in iOS.

## Check list
|Browser|Version|OS|Result|
|:---|:---|:---|:---:|
|Safari|10.1.1|MacOSX Sierra|◯|
|FireFox|52.0.2|MacOSX Sierra|◯|
|Chrome|58.0.3029.110|MacOSX Sierra|◯|

## How to use

### import tag
```html
<script type="riot/tag" src="path/to/TabBarController.tag"></script>
```
### mount with tags
Please note that you need to write with lowercase.
```html
<tabbarcontroller tabs={ [
    { tagName : "firstviewcontroller", opt : {} },
    { tagName : "secondviewcontroller", opt : {} },
    { tagName : "thirdviewcontroller", opt : {} }
] } />
```

## Access
From the tag of the child you can refer from opts.nav
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

