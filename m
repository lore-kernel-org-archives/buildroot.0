From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  6 Apr 2015 22:07:46 -0300
Subject: [Buildroot] [PATCH 22/27] xlib_libXext: add hash file
In-Reply-To: <1428368871-19332-1-git-send-email-gustavo@zacarias.com.ar>
References: <1428368871-19332-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1428368871-19332-22-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/x11r7/xlib_libXext/xlib_libXext.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/x11r7/xlib_libXext/xlib_libXext.hash

diff --git a/package/x11r7/xlib_libXext/xlib_libXext.hash b/package/x11r7/xlib_libXext/xlib_libXext.hash
new file mode 100644
index 0000000..45b7544
--- /dev/null
+++ b/package/x11r7/xlib_libXext/xlib_libXext.hash
@@ -0,0 +1,2 @@
+# From http://lists.freedesktop.org/pipermail/xorg/2014-July/056771.html
+sha256	b518d4d332231f313371fdefac59e3776f4f0823bcb23cf7c7305bfb57b16e35	libXext-1.3.3.tar.bz2
-- 
2.0.5
