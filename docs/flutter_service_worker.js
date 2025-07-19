'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "2246b7292fbe3cef2682af11268aad09",
"assets/AssetManifest.bin.json": "1293231b89875224f3c6f92c7650abf3",
"assets/AssetManifest.json": "3f90550cc2b69bc9261372112c1e5c84",
"assets/assets/fonts/Cairo-Regular.ttf": "45aaa2b5f9de1d61c2d3fe1f40107ac8",
"assets/assets/images/%25D8%25A7%25D9%2584%25D8%25B7%25D9%2588%25D8%25A8-%25D8%25A7%25D9%2584%25D8%25A7%25D8%25AD%25D9%2585%25D8%25B1-1024x1024.webp": "c8945717e185f0f610deb19b5b69ddd6",
"assets/assets/images/2014-635538129797759864-775_main.jpg": "d4281121ac704569ada6a1c107a6fe07",
"assets/assets/images/20211104095950315.jpg": "d06190dac8a7879b599c20c190dd35cb",
"assets/assets/images/950751_orig%2520(1).jpg": "93a84258d3c88be538bf1206f75728ba",
"assets/assets/images/950751_orig.jpg": "93a84258d3c88be538bf1206f75728ba",
"assets/assets/images/Fly_Ash_Bricks-e1663762167513.jpg": "457f33b1a08e880e11c0580a1cd1ea09",
"assets/assets/images/images%2520(1).jpeg": "7dfbd7ddecdbaa9b34701f32eada44d7",
"assets/assets/images/images%2520(2).jpeg": "b0bd00881044d551eb224ec49776b32b",
"assets/assets/images/images.jpeg": "72ba60d9e5718d340e3b1b2fb0a78f16",
"assets/assets/images/IMG_4406-scaled.jpg": "5a854345d13286abcc9e7e3dfe4dedf8",
"assets/assets/images/mahwaalblok.jpg": "827c8be4863ebf99c1b5fe8bf431cab2",
"assets/assets/images/ptFaN1736421266.webp": "d87cfd48a68e7d731d3c87ea559a1290",
"assets/assets/images/WhatsApp%2520Image%25202025-07-17%2520at%252018.07.45_0dabc515.jpg": "3e6cd59074aac453ffda90a5d816c988",
"assets/assets/images/WhatsApp%2520Image%25202025-07-17%2520at%252018.07.45_881fcb54.jpg": "b1eebb3dabc4c11d0b0ceec261d1c6a4",
"assets/assets/images/WhatsApp%2520Image%25202025-07-17%2520at%252018.07.45_8a326111.jpg": "b1a651b40ee4ff867f901557399dcda4",
"assets/assets/images/WhatsApp%2520Image%25202025-07-17%2520at%252018.07.45_a2549ae5.jpg": "31b74d09d4d916ea78948fac5b5ce011",
"assets/assets/images/WhatsApp%2520Image%25202025-07-17%2520at%252018.07.45_ad16c109.jpg": "31b74d09d4d916ea78948fac5b5ce011",
"assets/assets/images/WhatsApp%2520Image%25202025-07-17%2520at%252018.07.46_16e78394.jpg": "8235d690bc4533e2f2cd2138d267df98",
"assets/assets/images/WhatsApp%2520Image%25202025-07-17%2520at%252018.07.46_5d94b31f.jpg": "3f8d9a7cf688d559fe45110bd8c3d24d",
"assets/assets/images/WhatsApp%2520Image%25202025-07-17%2520at%252018.07.46_983df184.jpg": "207bbdedf5afde61fa28bcdf3fb4a16d",
"assets/assets/images/WhatsApp%2520Image%25202025-07-17%2520at%252018.07.46_9ba2df26.jpg": "8b1c9fbfaabedfbed41d4384bab40750",
"assets/FontManifest.json": "4085d1fee47f4944e19010b838c913c1",
"assets/fonts/MaterialIcons-Regular.otf": "3da3708bd2e74f66ba063d81882a4ee2",
"assets/NOTICES": "b6f2f522b6601619715b3ceed5e78265",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"flutter_bootstrap.js": "92cc9381d954fa079834b3a32bf242a9",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "36f312c01b3659e67493ab5c02c171c6",
"/": "36f312c01b3659e67493ab5c02c171c6",
"main.dart.js": "2e082daca51745151f0398c348129746",
"manifest.json": "2970a94d912e47732f847257dabc5a5d",
"version.json": "2f958ab5a3a23e378510f1ed766fe8e1"};
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
