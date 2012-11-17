From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 17 Nov 2012 17:13:28 +0100
Subject: [Buildroot] [git commit] alsa-lib: bump to version 1.0.26
Message-ID: <20121117163109.8F72E9972A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4f2e4f24d8a29c40519daa07f39e702a1d70fd4f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/alsa-lib/alsa-lib.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index 8ed1339..daa551d 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -4,9 +4,9 @@
 #
 #############################################################
 
-ALSA_LIB_VERSION = 1.0.25
+ALSA_LIB_VERSION = 1.0.26
 ALSA_LIB_SOURCE = alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
-ALSA_LIB_SITE = ftp://ftp.alsa-project.org/pub/lib
+ALSA_LIB_SITE = http://alsa.cybermirror.org/lib
 ALSA_LIB_LICENSE = LGPLv2.1+
 ALSA_LIB_LICENSE_FILES = COPYING
 ALSA_LIB_INSTALL_STAGING = YES
