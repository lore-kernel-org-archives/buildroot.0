From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 15 Apr 2013 23:55:09 +0200
Subject: [Buildroot] [git commit] kbd: add license information
Message-ID: <20130415215907.D7EAE9B6DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=46ecd9117d0d74fd10c06ff322e87f25cf275d74
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/kbd/kbd.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/kbd/kbd.mk b/package/kbd/kbd.mk
index 325978e..08cb077 100644
--- a/package/kbd/kbd.mk
+++ b/package/kbd/kbd.mk
@@ -1,6 +1,14 @@
+#############################################################
+#
+# kbd
+#
+#############################################################
+
 KBD_VERSION = 1.15.2
 KBD_SOURCE = kbd-$(KBD_VERSION).tar.gz
 KBD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kbd
+KBD_LICENSE = GPLv2+
+KBD_LICENSE_FILES = COPYING
 
 KBD_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 
