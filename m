From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 18 Apr 2015 21:54:16 +0200
Subject: [Buildroot] [PATCH 31/35] package/x11r7/xlib_libXres: add hash
In-Reply-To: <1429386860-16631-1-git-send-email-bernd.kuhls@t-online.de>
References: <1429386860-16631-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1429386860-16631-31-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libXres/xlib_libXres.hash |    2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/x11r7/xlib_libXres/xlib_libXres.hash

diff --git a/package/x11r7/xlib_libXres/xlib_libXres.hash b/package/x11r7/xlib_libXres/xlib_libXres.hash
new file mode 100644
index 0000000..063df8e
--- /dev/null
+++ b/package/x11r7/xlib_libXres/xlib_libXres.hash
@@ -0,0 +1,2 @@
+# From http://lists.x.org/archives/xorg-announce/2013-May/002233.html
+sha256	26899054aa87f81b17becc68e8645b240f140464cf90c42616ebb263ec5fa0e5	libXres-1.0.7.tar.bz2
-- 
1.7.10.4
