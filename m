From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  6 Apr 2015 22:07:33 -0300
Subject: [Buildroot] [PATCH 09/27] xlib_libXi: add hash file
In-Reply-To: <1428368871-19332-1-git-send-email-gustavo@zacarias.com.ar>
References: <1428368871-19332-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1428368871-19332-9-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/x11r7/xlib_libXi/xlib_libXi.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/x11r7/xlib_libXi/xlib_libXi.hash

diff --git a/package/x11r7/xlib_libXi/xlib_libXi.hash b/package/x11r7/xlib_libXi/xlib_libXi.hash
new file mode 100644
index 0000000..75497f7
--- /dev/null
+++ b/package/x11r7/xlib_libXi/xlib_libXi.hash
@@ -0,0 +1,2 @@
+# From http://lists.freedesktop.org/pipermail/xorg/2014-July/056751.html
+sha256	2cffc2686618dc1803725636cd92b36342c512dc60a7a35cba34bf7192a42244	libXi-1.7.4.tar.bz2
-- 
2.0.5
