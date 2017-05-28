From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 28 May 2017 17:38:16 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/tremor: add upstream site to
	help text
Message-ID: <20170528153816.3555-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tremor/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/tremor/Config.in b/package/tremor/Config.in
index 1a478c47a..ec7b8f8c0 100644
--- a/package/tremor/Config.in
+++ b/package/tremor/Config.in
@@ -6,3 +6,5 @@ config BR2_PACKAGE_TREMOR
 	  decoder. It provides a decoding API similar to libvorbis,
 	  but gives much better performance on systems without a
 	  floating-point unit.
+
+	  https://wiki.xiph.org/Tremor
-- 
2.11.0
