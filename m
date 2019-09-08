From: Christopher McCrory <chrismcc@gmail.com>
Date: Sun,  8 Sep 2019 09:12:58 -0700
Subject: [Buildroot] [PATCH 24/27] package/x11r7/xlib_libXaw: Add license
 hash
Message-ID: <20190908161258.27319-1-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
---
 package/x11r7/xlib_libXaw/xlib_libXaw.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/x11r7/xlib_libXaw/xlib_libXaw.hash b/package/x11r7/xlib_libXaw/xlib_libXaw.hash
index a948e8fd9b..159e007bc3 100644
--- a/package/x11r7/xlib_libXaw/xlib_libXaw.hash
+++ b/package/x11r7/xlib_libXaw/xlib_libXaw.hash
@@ -1,2 +1,4 @@
 # From http://lists.x.org/archives/xorg-announce/2015-April/002591.html
 sha256	8ef8067312571292ccc2bbe94c41109dcf022ea5a4ec71656a83d8cce9edb0cd	libXaw-1.0.13.tar.bz2
+# Locally calculated
+sha256 9f5adb26952f93b3e4650285b94ec6c61a27aab5a21088bfb6694001be1b360d COPYING
-- 
2.20.1
