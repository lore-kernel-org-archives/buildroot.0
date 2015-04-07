From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  6 Apr 2015 22:07:30 -0300
Subject: [Buildroot] [PATCH 06/27] xlib_libXv: add hash file
In-Reply-To: <1428368871-19332-1-git-send-email-gustavo@zacarias.com.ar>
References: <1428368871-19332-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1428368871-19332-6-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/x11r7/xlib_libXv/xlib_libXv.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/x11r7/xlib_libXv/xlib_libXv.hash

diff --git a/package/x11r7/xlib_libXv/xlib_libXv.hash b/package/x11r7/xlib_libXv/xlib_libXv.hash
new file mode 100644
index 0000000..3a54cb3
--- /dev/null
+++ b/package/x11r7/xlib_libXv/xlib_libXv.hash
@@ -0,0 +1,2 @@
+# From http://lists.freedesktop.org/archives/xorg/2013-September/056012.html
+sha256	55fe92f8686ce8612e2c1bfaf58c057715534419da700bda8d517b1d97914525	libXv-1.0.10.tar.bz2
-- 
2.0.5
