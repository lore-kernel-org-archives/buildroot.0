From: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Date: Tue, 14 Jun 2016 10:45:27 +0200
Subject: [Buildroot] [PATCH] gst1-plugins-bad: remove obsolete gettext patch
Message-ID: <1465893927-8430-1-git-send-email-marcin.nowakowski@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The patch to update gettext version is unnecessary, as gettexttize is
enabled and therefore an always up-to-date version is used.

Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
---
 .../gst1-plugins-bad/0001-use-gettext-0.18.patch        | 17 -----------------
 1 file changed, 17 deletions(-)
 delete mode 100644 package/gstreamer1/gst1-plugins-bad/0001-use-gettext-0.18.patch

diff --git a/package/gstreamer1/gst1-plugins-bad/0001-use-gettext-0.18.patch b/package/gstreamer1/gst1-plugins-bad/0001-use-gettext-0.18.patch
deleted file mode 100644
index ebf4567..0000000
--- a/package/gstreamer1/gst1-plugins-bad/0001-use-gettext-0.18.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Use newer version of gettext to match current buildroot gettext.
-
-Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
-----
-Index: gst1-plugins-bad-1.1.1/po/Makefile.in.in
-===================================================================
---- gst1-plugins-bad-1.1.1.orig/po/Makefile.in.in
-+++ gst1-plugins-bad-1.1.1/po/Makefile.in.in
-@@ -9,7 +9,7 @@
- # General Public License and is *not* in the public domain.
- #
- # Origin: gettext-0.17
--GETTEXT_MACRO_VERSION = 0.17
-+GETTEXT_MACRO_VERSION = 0.18
- 
- PACKAGE = @PACKAGE@
- VERSION = @VERSION@
-- 
2.8.2
