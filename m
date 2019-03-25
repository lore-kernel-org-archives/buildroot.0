From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Mar 2019 21:23:31 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/x11r7/xapp_xdm:
 security bump to version 1.1.12
Message-ID: <20190325202106.7F0A6814E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=48b328c19578cab09594f94a2f1659d12ecd51a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes CVE-2013-2179.

Release notes:
https://lists.x.org/archives/xorg-announce/2019-March/002959.html

Added all license hashes provided by upstream and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2776484107b8f8640e0771c3ffe45b62a78920fb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xapp_xdm/xapp_xdm.hash | 9 +++++++--
 package/x11r7/xapp_xdm/xapp_xdm.mk   | 2 +-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xapp_xdm/xapp_xdm.hash b/package/x11r7/xapp_xdm/xapp_xdm.hash
index 207d769fbf..605be9debc 100644
--- a/package/x11r7/xapp_xdm/xapp_xdm.hash
+++ b/package/x11r7/xapp_xdm/xapp_xdm.hash
@@ -1,2 +1,7 @@
-# From http://lists.x.org/archives/xorg-announce/2011-September/001737.html
-sha256	d4da426ddea0124279a3f2e00a26db61944690628ee818a64df9d27352081c47	xdm-1.1.11.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2019-March/002959.html
+md5 47c4c3bf8d59b64b64d134df8b5e5ec5  xdm-1.1.12.tar.bz2
+sha1 5cc5590e40837949b1a63cb030878f8ceebd4d85  xdm-1.1.12.tar.bz2
+sha256 0dd283f72dda098d09e2925b9278c95e21551e693a5802ab442d1b577d8327f4  xdm-1.1.12.tar.bz2
+sha512 1a4be0a070ced5db8fda6fc74794c9f9ed0cb37fa440fda6a3a7652aff62dfc3d7ba68b9facf054671ebf0f4db2a0eec29d0aa3716e3407ccd5529bac3553bdb  xdm-1.1.12.tar.bz2
+# Locally computed
+sha256 b33b4bebbd6511b3e15315e8e29d67f25334ee45da8b7da6e6e97c53a70c6923  COPYING
diff --git a/package/x11r7/xapp_xdm/xapp_xdm.mk b/package/x11r7/xapp_xdm/xapp_xdm.mk
index 422ee53b10..3c91e21579 100644
--- a/package/x11r7/xapp_xdm/xapp_xdm.mk
+++ b/package/x11r7/xapp_xdm/xapp_xdm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XDM_VERSION = 1.1.11
+XAPP_XDM_VERSION = 1.1.12
 XAPP_XDM_SOURCE = xdm-$(XAPP_XDM_VERSION).tar.bz2
 XAPP_XDM_SITE = http://xorg.freedesktop.org/releases/individual/app
 XAPP_XDM_LICENSE = MIT
