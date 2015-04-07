From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  6 Apr 2015 22:07:38 -0300
Subject: [Buildroot] [PATCH 14/27] xlib_libXmu: add hash file
In-Reply-To: <1428368871-19332-1-git-send-email-gustavo@zacarias.com.ar>
References: <1428368871-19332-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1428368871-19332-14-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/x11r7/xlib_libXmu/xlib_libXmu.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/x11r7/xlib_libXmu/xlib_libXmu.hash

diff --git a/package/x11r7/xlib_libXmu/xlib_libXmu.hash b/package/x11r7/xlib_libXmu/xlib_libXmu.hash
new file mode 100644
index 0000000..2c96d96
--- /dev/null
+++ b/package/x11r7/xlib_libXmu/xlib_libXmu.hash
@@ -0,0 +1,2 @@
+# From http://lists.freedesktop.org/archives/xorg/2013-September/056009.html
+sha256	756edc7c383254eef8b4e1b733c3bf1dc061b523c9f9833ac7058378b8349d0b	libXmu-1.1.2.tar.bz2
-- 
2.0.5
