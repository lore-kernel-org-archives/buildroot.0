From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 18 Apr 2015 21:54:13 +0200
Subject: [Buildroot] [PATCH 28/35] package/x11r7/xlib_libXfixes: add hash
In-Reply-To: <1429386860-16631-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429386860-16631-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429386860-16631-28-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libXfixes/xlib_libXfixes.hash |    2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/x11r7/xlib_libXfixes/xlib_libXfixes.hash

diff --git a/package/x11r7/xlib_libXfixes/xlib_libXfixes.hash b/package/x11r7/xlib_libXfixes/xlib_libXfixes.hash
new file mode 100644
index 0000000..291c4bd
--- /dev/null
+++ b/package/x11r7/xlib_libXfixes/xlib_libXfixes.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2013-May/002227.html
+sha256	63bec085084fa3caaee5180490dd871f1eb2020ba9e9b39a30f93693ffc34767	libXfixes-5.0.1.tar.bz2
-- 
1.7.10.4
