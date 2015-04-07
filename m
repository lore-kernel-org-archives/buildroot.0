From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  6 Apr 2015 22:07:43 -0300
Subject: [Buildroot] [PATCH 19/27] xlib_libSM: add hash file
In-Reply-To: <1428368871-19332-1-git-send-email-gustavo@zacarias.com.ar>
References: <1428368871-19332-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1428368871-19332-19-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/x11r7/xlib_libSM/xlib_libSM.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/x11r7/xlib_libSM/xlib_libSM.hash

diff --git a/package/x11r7/xlib_libSM/xlib_libSM.hash b/package/x11r7/xlib_libSM/xlib_libSM.hash
new file mode 100644
index 0000000..79dc25c
--- /dev/null
+++ b/package/x11r7/xlib_libSM/xlib_libSM.hash
@@ -0,0 +1,2 @@
+# From http://lists.freedesktop.org/archives/xorg/2013-September/056013.html
+sha256	0baca8c9f5d934450a70896c4ad38d06475521255ca63b717a6510fdb6e287bd	libSM-1.2.2.tar.bz2
-- 
2.0.5
