From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  6 Apr 2015 22:07:48 -0300
Subject: [Buildroot] [PATCH 24/27] xlib_libXrandr: add hash file
In-Reply-To: <1428368871-19332-1-git-send-email-gustavo@zacarias.com.ar>
References: <1428368871-19332-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1428368871-19332-24-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/x11r7/xlib_libXrandr/xlib_libXrandr.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/x11r7/xlib_libXrandr/xlib_libXrandr.hash

diff --git a/package/x11r7/xlib_libXrandr/xlib_libXrandr.hash b/package/x11r7/xlib_libXrandr/xlib_libXrandr.hash
new file mode 100644
index 0000000..1f2ce3e
--- /dev/null
+++ b/package/x11r7/xlib_libXrandr/xlib_libXrandr.hash
@@ -0,0 +1,2 @@
+# From http://lists.freedesktop.org/archives/xorg/2013-September/056011.html
+sha256	caa7b31ac769be51a532343c65376f1d4df3f307afaed58e34fb5e82e8b825ad	libXrandr-1.4.2.tar.bz2
-- 
2.0.5
