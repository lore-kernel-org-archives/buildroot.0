From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  6 Apr 2015 22:07:39 -0300
Subject: [Buildroot] [PATCH 15/27] xlib_libXaw: add hash file
In-Reply-To: <1428368871-19332-1-git-send-email-gustavo@zacarias.com.ar>
References: <1428368871-19332-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1428368871-19332-15-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/x11r7/xlib_libXaw/xlib_libXaw.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/x11r7/xlib_libXaw/xlib_libXaw.hash

diff --git a/package/x11r7/xlib_libXaw/xlib_libXaw.hash b/package/x11r7/xlib_libXaw/xlib_libXaw.hash
new file mode 100644
index 0000000..a8bb3f9
--- /dev/null
+++ b/package/x11r7/xlib_libXaw/xlib_libXaw.hash
@@ -0,0 +1,2 @@
+# From http://lists.freedesktop.org/archives/xorg/2013-September/056008.html
+sha256	96fc314874fce9979556321d1d6ee00b5baf32fb333b7278853b4983bc3cdbf6	libXaw-1.0.12.tar.bz2
-- 
2.0.5
