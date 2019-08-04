From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Aug 2019 11:03:09 +0200
Subject: [Buildroot] [git commit] package/mtools: bump version to 4.0.23
Message-ID: <20190804090540.CF0508142D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8c2a09f8a65fd0bcb6a9da96ccc7c8405a328842
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switched to .lz tarball.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
