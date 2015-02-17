From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 17 Feb 2015 10:43:55 -0300
Subject: [Buildroot] [PATCH 2/2] xterm: bump to version 314
In-Reply-To: <1424180635-10327-1-git-send-email-gustavo@zacarias.com.ar>
References: <1424180635-10327-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1424180635-10327-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/xterm/xterm.hash | 2 ++
 package/xterm/xterm.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/xterm/xterm.hash

diff --git a/package/xterm/xterm.hash b/package/xterm/xterm.hash
new file mode 100644
index 0000000..d36d1c4
--- /dev/null
+++ b/package/xterm/xterm.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	1dbf1e93796c1b71b22b84e82eb58bcf20a14a7f365158819f3b4dbb29fe93f0	xterm-314.tgz
diff --git a/package/xterm/xterm.mk b/package/xterm/xterm.mk
index 7413875..56f692d 100644
--- a/package/xterm/xterm.mk
+++ b/package/xterm/xterm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XTERM_VERSION = 306
+XTERM_VERSION = 314
 XTERM_SOURCE = xterm-$(XTERM_VERSION).tgz
 XTERM_SITE = ftp://invisible-island.net/xterm
 XTERM_DEPENDENCIES = ncurses xlib_libXaw
-- 
2.0.5
