From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 29 Jul 2019 20:12:04 +0200
Subject: [Buildroot] [PATCH 03/11] package/libsamplerate: add license hash
In-Reply-To: <20190729181212.10341-1-bernd.kuhls@t-online.de>
References: <20190729181212.10341-1-bernd.kuhls@t-online.de>
Message-ID: <20190729181212.10341-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Partly fixes:
http://autobuild.buildroot.net/results/f0f/f0fd05ce8a8b595015baf625481b58967df53458/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libsamplerate/libsamplerate.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libsamplerate/libsamplerate.hash b/package/libsamplerate/libsamplerate.hash
index a303f0bcf8..73722563ef 100644
--- a/package/libsamplerate/libsamplerate.hash
+++ b/package/libsamplerate/libsamplerate.hash
@@ -1,2 +1,4 @@
 # Locally calculated after checking pgp signature
 sha256  0a7eb168e2f21353fb6d84da152e4512126f7dc48ccb0be80578c565413444c1  libsamplerate-0.1.9.tar.gz
+# Locally computed
+sha256 2c1f76ce2effdddb425018405d5690c0b1ab4e6976e35296b0a6db65c5e1a55d  COPYING
-- 
2.20.1
