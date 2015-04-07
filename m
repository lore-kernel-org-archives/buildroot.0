From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  6 Apr 2015 22:07:31 -0300
Subject: [Buildroot] [PATCH 07/27] xlib_libFS: add hash file
In-Reply-To: <1428368871-19332-1-git-send-email-gustavo@zacarias.com.ar>
References: <1428368871-19332-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1428368871-19332-7-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/x11r7/xlib_libFS/xlib_libFS.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/x11r7/xlib_libFS/xlib_libFS.hash

diff --git a/package/x11r7/xlib_libFS/xlib_libFS.hash b/package/x11r7/xlib_libFS/xlib_libFS.hash
new file mode 100644
index 0000000..390aa0c
--- /dev/null
+++ b/package/x11r7/xlib_libFS/xlib_libFS.hash
@@ -0,0 +1,2 @@
+# From http://lists.freedesktop.org/archives/xorg/2014-March/056484.html
+sha256	9007fcfbd37bfa6ede4000ec4b5c2dc6dc0f52789358361b43f68e9ae4d6aed7	libFS-1.0.6.tar.bz2
-- 
2.0.5
