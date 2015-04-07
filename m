From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  6 Apr 2015 22:07:37 -0300
Subject: [Buildroot] [PATCH 13/27] xlib_libXpm: add hash file
In-Reply-To: <1428368871-19332-1-git-send-email-gustavo@zacarias.com.ar>
References: <1428368871-19332-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1428368871-19332-13-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/x11r7/xlib_libXpm/xlib_libXpm.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/x11r7/xlib_libXpm/xlib_libXpm.hash

diff --git a/package/x11r7/xlib_libXpm/xlib_libXpm.hash b/package/x11r7/xlib_libXpm/xlib_libXpm.hash
new file mode 100644
index 0000000..22c9fc6
--- /dev/null
+++ b/package/x11r7/xlib_libXpm/xlib_libXpm.hash
@@ -0,0 +1,2 @@
+# From http://lists.freedesktop.org/archives/xorg/2013-September/056010.html
+sha256	c5bdafa51d1ae30086fac01ab83be8d47fe117b238d3437f8e965434090e041c	libXpm-3.5.11.tar.bz2
-- 
2.0.5
