# Google Drive Picker

Promise-based wrapping of [Google's Picker API][docs].

Google's JS client library requires [a lot of callbacks][picker_hiworld] to load necessary APIs, authorize and build a Google Drive file picker. This project eliminates that boilerplate, wrapping functions in [ES6 Promises][promise].

## Use

Before using the library you will need to create a project through the [Google Developer Console][console], enable the **Google Picker API** and create credentials for OAuth and Public API access.

Required: Google's API loaded (https://apis.google.com/js/api.js) and [Promise support][caniuse_promise] or a [polyfill][polyfill].

```js
// Build a picker
var picker = new GoogleDrivePicker({
  apiKey:   'myApiKey',
  clientId: 'myClientId'
});

// Use it
picker.pick()
      .then(function(data) {
        // Handle successful response (User selected a file)
        alert(data.docs[0]]);
      });
```

Detailed configuration can be performed through a function that is yielded a `PickerBuilder` instance. See the [Google Picker API documentation][docs] for further information.

```js
var picker = new GoogleDrivePicker({
  apiKey: 'myApiKey',
  clientId: 'myClientId',
  config: function(builder) {
    builder.addView(google.picker.ViewId.VIDEO_SEARCH)
           .enableFeature(google.picker.Feature.NAV_HIDDEN)
           .setLocale('de');
  }
});
```

[docs]: https://developers.google.com/picker/docs/
[picker_hiworld]: https://developers.google.com/picker/docs/#hiworld
[console]: https://console.developers.google.com/
[promise]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise
[caniuse_promise]: http://caniuse.com/#feat=promises
[polyfill]: https://github.com/getify/native-promise-only
