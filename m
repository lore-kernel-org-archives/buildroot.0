From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  4 Aug 2019 09:31:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/mtools: bump version to 4.0.23
Message-ID: <20190804073157.1709-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switched to .lz tarball.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mtools/mtools.hash | 2 +-
 package/mtools/mtools.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mtools/mtools.hash b/package/mtools/mtools.hash
index 0dc172a152..1efc99a6b2 100644
--- a/package/mtools/mtools.hash
+++ b/package/mtools/mtools.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256	59e9cf80885399c4f229e5d87e49c0c2bfeec044e1386d59fcd0b0aead6b2f85	mtools-4.0.18.tar.bz2
+sha256	c708ff513fada78060a9e55db7c8d169d82d0e3d4afbd7c2744dce6ae0bfdb6d	mtools-4.0.23.tar.lz
 
 # Locally calculated
 sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
diff --git a/package/mtools/mtools.mk b/package/mtools/mtools.mk
index 1a6218831e..bd3444022f 100644
--- a/package/mtools/mtools.mk
+++ b/package/mtools/mtools.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MTOOLS_VERSION = 4.0.18
-MTOOLS_SOURCE = mtools-$(MTOOLS_VERSION).tar.bz2
+MTOOLS_VERSION = 4.0.23
+MTOOLS_SOURCE = mtools-$(MTOOLS_VERSION).tar.lz
 MTOOLS_SITE = $(BR2_GNU_MIRROR)/mtools
 MTOOLS_LICENSE = GPL-3.0+
 MTOOLS_LICENSE_FILES = COPYING
-- 
2.20.1
