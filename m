From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  6 Oct 2019 16:26:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/libraw: bump version to 0.19.5
Message-ID: <20191006142629.20516-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes: https://www.libraw.org/news/libraw-0-19-5-release

Updated hash of README.md after upstream commit:
https://github.com/LibRaw/LibRaw/commit/292c2763c93352f606fb1d7ab3ab57b6de883903

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libraw/libraw.hash | 4 ++--
 package/libraw/libraw.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libraw/libraw.hash b/package/libraw/libraw.hash
index 643a2109b5..3337396f5f 100644
--- a/package/libraw/libraw.hash
+++ b/package/libraw/libraw.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256	400d47969292291d297873a06fb0535ccce70728117463927ddd9452aa849644	LibRaw-0.19.2.tar.gz
+sha256	40a262d7cc71702711a0faec106118ee004f86c86cc228281d12d16da03e02f5	LibRaw-0.19.5.tar.gz
 sha256	eea173a556abac0370461e57e12aab266894ea6be3874c2be05fd87871f75449	LICENSE.LGPL
 sha256	0e3098d2d54a12434715f6679ea408d57da5e8d613c385c58ecc6fe5d30cc81f	LICENSE.CDDL
-sha256	eee0055723d3483ef3ee7920e2178177b14a334c2a622be4101bcfb05d21407e	README.md
+sha256	ed971b7f1f57fd8e7d28419ff7749cfe0f296e701687756e798a69555fd76646	README.md
diff --git a/package/libraw/libraw.mk b/package/libraw/libraw.mk
index 0d95207b73..9a647f8d54 100644
--- a/package/libraw/libraw.mk
+++ b/package/libraw/libraw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRAW_VERSION = 0.19.2
+LIBRAW_VERSION = 0.19.5
 LIBRAW_SOURCE = LibRaw-$(LIBRAW_VERSION).tar.gz
 LIBRAW_SITE = http://www.libraw.org/data
 LIBRAW_INSTALL_STAGING = YES
-- 
2.20.1
