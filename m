From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Apr 2019 22:45:59 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/webkitgtk: bump
 version to 2.22.7
Message-ID: <20190405204614.1006E815D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2fc6b8ad5fdc59a79e637fd5c5f38df0ceeb400f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

2.22.7 contains a number of bugfixes. From the announcement:

 - Fix rendering of glyphs in Hebrew (and possibly other languages) when
   Unicode NFC normalization is used.

 - Fix several crashes and race conditions.

https://webkitgtk.org/2019/03/01/webkitgtk2.22.7-released.html

Change SITE to https as the webserver uses HSTS.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d484ba63b58c01ba6d723341ab91e83aaf2632ee)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webkitgtk/webkitgtk.hash | 8 ++++----
 package/webkitgtk/webkitgtk.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index ed2511976d..d024343d5e 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,7 +1,7 @@
-# From https://webkitgtk.org/releases/webkitgtk-2.22.6.tar.xz.sums
-md5 7c21a30f7f078f0b712caf0c7ee966a4 webkitgtk-2.22.6.tar.xz
-sha1 26a8f8951da03aa4dfc2c25257b6899ea3c2558f webkitgtk-2.22.6.tar.xz
-sha256 df90db9c0db0a2072b945fa3e1d45865922bd686c4659cce6cb5897ce357c85b webkitgtk-2.22.6.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.22.7.tar.xz.sums
+md5 47386c10a9c3975f933c85404f35ff3b webkitgtk-2.22.7.tar.xz
+sha1 5f45147f6fc4b6a0dd3c545bf857679313230507 webkitgtk-2.22.7.tar.xz
+sha256 4be6f7d605cd0a690fd26e8aa83b089a33ad9d419148eafcfb60580dd2af30ff webkitgtk-2.22.7.tar.xz
 
 # Hashes for license files:
 sha256 0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4 Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index c17bbc8028..a30c61460a 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.22.6
-WEBKITGTK_SITE = http://www.webkitgtk.org/releases
+WEBKITGTK_VERSION = 2.22.7
+WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
 WEBKITGTK_LICENSE = LGPL-2.1+, BSD-2-Clause
