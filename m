From: Jesper Baekdahl <jbb@gamblify.com>
Date: Mon, 18 Mar 2013 14:05:22 +0100
Subject: [Buildroot] [PATCH 116/120] xutil_util-macros: bump revision to
	X11R7.7
In-Reply-To: <1363611926-27105-1-git-send-email-jbb@gamblify.com>
References: <1363611926-27105-1-git-send-email-jbb@gamblify.com>
Message-ID: <1363611926-27105-57-git-send-email-jbb@gamblify.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Will Wagner <will_wagner@carallon.com>

Signed-off-by: Will Wagner <will_wagner@carallon.com>
Signed-off-by: Jesper Baekdahl <jbb@gamblify.com>
---
 package/x11r7/xutil_util-macros/xutil_util-macros-1.17.patch |    9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 package/x11r7/xutil_util-macros/xutil_util-macros-1.17.patch

diff --git a/package/x11r7/xutil_util-macros/xutil_util-macros-1.17.patch b/package/x11r7/xutil_util-macros/xutil_util-macros-1.17.patch
new file mode 100644
index 0000000..167229d
--- /dev/null
+++ b/package/x11r7/xutil_util-macros/xutil_util-macros-1.17.patch
@@ -0,0 +1,9 @@
+--- xutil_util-macros-1.8.0/xorg-macros.m4.in.orig	2010-05-27 14:03:30.000000000 +0100
++++ xutil_util-macros-1.8.0/xorg-macros.m4.in	2011-11-09 11:57:41.000000000 +0000
+@@ -1064,3 +1064,6 @@ mv \$(top_srcdir)/.INSTALL.tmp \$(top_sr
+ echo 'util-macros \"pkgdatadir\" from xorg-macros.pc not found: installing possibly empty INSTALL.' >&2)"
+ AC_SUBST([INSTALL_CMD])
+ ]) # XORG_INSTALL
++
++# Buildroot stuff
++AC_SUBST(STAGING_DIR)
-- 
1.7.10.4
