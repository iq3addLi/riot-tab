# riot-tab
A radio-style selection view manager for riot.js like UITabBarController in iOS.

<a href="https://www.npmjs.com/package/riot-tab"><img src="https://img.shields.io/npm/v/riot-tab.svg?style=shield"></a>

Although it is a reference, the following points are different.

* Do not include UI.
* Add methods I wanted for iOS version.

## How to use

### Case1. manual install
#### import tag
```html
<script type="riot/tag" src="path/to/TabBarController.tag"></script>
```
#### mount with tags
Please note that you need to write with lowercase.
```javascript
<tabbarcontroller tabs={ [
    { tagName : "firstviewcontroller", opts : {} },
    { tagName : "secondviewcontroller", opts : {} },
    { tagName : "thirdviewcontroller", opts : {} }
] } />
```
#### with riot-nav
When used with [riot-nav](https://github.com/iq3addLi/riot-nav).
```javascript
<tabbarcontroller tabs={ [
    { tagName : "navigationcontroller", opts : { root : "firstviewcontroller" } },
    { tagName : "navigationcontroller", opts : { root : "secondviewcontroller" } },
    { tagName : "navigationcontroller", opts : { root : "thirdviewcontroller" } }
] } />
```

### Case2. npm & rollup
In order to use this method, you need to install the following software. You need to set rollup.config.js, but I will omit it here.
* npm
* rollup
* rollup-plugin-riot
* rollup-plugin-node-resolve
* rollup-plugin-commonjs

#### npm install
```bash
npm install --save riot-tab
```
#### import riot-tab
```javascript
import 'riot-tab/dist/TabBarController.tag'
```
#### mount
```javascript
<tabbarcontroller tabs={ [
    { tagName : "firstviewcontroller", opts : {} },
    { tagName : "secondviewcontroller", opts : {} },
    { tagName : "thirdviewcontroller", opts : {} }
] } />
```

## Access
From the tag of the child you can refer from opts.tab
```js
opts.tab
opts.tabBarController // Familiar to iOS engineers
```

#### from a child of riot-nav
```js
opts.nav.tab
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

### isActive
Check activing in a tag.
> ⚠️ This method can't use in on("mount",...).
```js
tab.isActive( tag )
```

### viewTags
Return tags by managed at riot-tab. It corresponds to ios tabbarController.viewcontrollers
> ⚠️  Not contain caller tag when call in on("mount",...).
```js
tab.viewTags()
```

## Lifecycle
The order called is shouldSelect -> didDeselect -> didSelect
### shouldSelect
Returns select tag is possible. If you do something and do not want to select, return false.
### didDeselect
Called when deselect.
### didSelect
Called when select.

## Demo
[View demo](https://iq3addli.github.io/riot-tab/index.html)

## Check list
|Browser|Version|OS|Result|
|:---|:---|:---|:---:|
|Safari|10.1.1|MacOSX Sierra|◯|
|FireFox|52.0.2|MacOSX Sierra|◯|
|Chrome|58.0.3029.110|MacOSX Sierra|◯|
