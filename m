From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 18 Apr 2015 21:54:15 +0200
Subject: [Buildroot] [PATCH 30/35] package/x11r7/xlib_libXrender: add hash
In-Reply-To: <1429386860-16631-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429386860-16631-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429386860-16631-30-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libXrender/xlib_libXrender.hash |    2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/x11r7/xlib_libXrender/xlib_libXrender.hash

diff --git a/package/x11r7/xlib_libXrender/xlib_libXrender.hash b/package/x11r7/xlib_libXrender/xlib_libXrender.hash
new file mode 100644
index 0000000..c2a623d
--- /dev/null
+++ b/package/x11r7/xlib_libXrender/xlib_libXrender.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2013-June/002249.html
+sha256	1d14b02f0060aec5d90dfdcf16a996f17002e515292906ed26e3dcbba0f4fc62	libXrender-0.9.8.tar.bz2
-- 
1.7.10.4
