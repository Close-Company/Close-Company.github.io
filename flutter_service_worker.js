'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"flutter_bootstrap.js": "07c2584e6a13b384060a0a3a26708c8a",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.js": "ba4a8ae1a65ff3ad81c6818fd47e348b",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/canvaskit.js": "6cfe36b4647fbfa15683e09e7dd366bc",
"main.dart.js": "4f556f0bd8ca85c9f060482f181abe80",
"version.json": "c134b44e37bd1dbe0bf3647aa4229201",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.json": "fa6e54affc991ddd0a39ed67431412e4",
"assets/assets/images/8.jpeg": "b92798d0e1c4e92c2469df43e24a3236",
"assets/assets/images/bg_7.jpg": "b71c97f08a286c4f24f0b58710d5ff5e",
"assets/assets/images/glasses.png": "afd30c5ea9ef8e75581e0e41125d024a",
"assets/assets/images/6.jpeg": "728e871d513692e0779dc11cd0c6f77e",
"assets/assets/images/woman.png": "d41196f2ba385625c4d63c29507b97bb",
"assets/assets/images/bg_4.jpg": "f95cb0d1646578a6777907f5e9a8095c",
"assets/assets/images/cap.png": "a04bc87418578d16e87aeedd8b28099d",
"assets/assets/images/bg_5.jpg": "d74fdeb53c835bc7825d3de72bf8f179",
"assets/assets/images/bg_1.jpg": "3ae96386b6d5aa3cc39d3e7768f7e37a",
"assets/assets/images/bg_2.jpg": "4ece9af77062520801da03bf8aefa136",
"assets/assets/images/bg_8.jpg": "01319cdced9b180be7dbf0fc1ac9ca96",
"assets/assets/images/pants.png": "a946425c58dbd7605c88cffaf70fa685",
"assets/assets/images/9.jpeg": "f1cf5c75904c7be6b49ed4dec919c514",
"assets/assets/images/bg_6.jpg": "91670e9be08ef98fbe571f102f4ac2fa",
"assets/assets/images/4.jpeg": "8606119d93a987f2c181a30ec9652b57",
"assets/assets/images/1.jpeg": "862b1df05edcf4ba06f38415bba4b486",
"assets/assets/images/shirt.png": "83ed78e93c03702b3615f34c3da717f0",
"assets/assets/images/3.jpeg": "7d92a5c4f0c7123418b1d236f9450ef5",
"assets/assets/images/2.jpeg": "f4e68118147f4d11e4ef237d01a544f2",
"assets/assets/images/7.jpeg": "5a6c4fc502088eb81ec4598e7883922f",
"assets/assets/images/shoes.png": "87e71465eb0659e21ade5b49c00904ca",
"assets/assets/images/10.jpeg": "37df65293e7afd956623c5c114bb6dea",
"assets/assets/images/bg_3.jpg": "5f95baa8b855210ce4cbf105ea2f9a0f",
"assets/assets/images/oculos.jpeg": "b5f174e0ee67fdc9925aebecc47ef32f",
"assets/assets/images/select.png": "770c6306287ffd3f8693d4445b153abe",
"assets/assets/images/girl.png": "728a84040dabbd4a4ad6a694679d825b",
"assets/assets/images/5.jpeg": "86cf87e2172cc3a54a0fdcde86d3df5f",
"assets/assets/images/boy.png": "3124e9d1ad2332c798d012a827290968",
"assets/assets/images/man.png": "605f0209f8624396a988c52d0349aa32",
"assets/assets/images/jacket.png": "5da4bd77220857b5423661627f110fb3",
"assets/assets/images/bg_9.jpg": "60410b51f43051e122500e4ddc6d7bf5",
"assets/NOTICES": "f2c1886f2450886eabbdc54b3b95b5b1",
"assets/AssetManifest.bin": "a6ba15f4b24d81ad1943605954d9cff3",
"assets/fonts/MaterialIcons-Regular.otf": "9d27c28fd7ca9687140c2797181006e2",
"assets/AssetManifest.bin.json": "98ae4b0803d2b1e5f3ee6a64eb5399d9",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"index.html": "35ba3fef3a83a2f140b2fffae079bd7b",
"/": "35ba3fef3a83a2f140b2fffae079bd7b",
"manifest.json": "1bd90e4a89898565bd5fdd64f0c09fb6",
"flutter.js": "76f08d47ff9f5715220992f993002504"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
