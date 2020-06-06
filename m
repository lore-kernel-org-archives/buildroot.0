From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Jun 2020 23:20:41 +0200
Subject: [Buildroot] [git commit] package/libarchive: bump to version 3.4.3
Message-ID: <20200606212002.E0955845D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3059319f643947c4d042fcd2ef48c1a9aeab9cc4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Libarchive 3.4.3 is a feature and bugfix release.

See https://github.com/libarchive/libarchive/releases/tag/v3.4.3

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libarchive/libarchive.hash | 2 +-
 package/libarchive/libarchive.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
index 9da4eb3baa..0660378097 100644
--- a/package/libarchive/libarchive.hash
+++ b/package/libarchive/libarchive.hash
@@ -1,4 +1,4 @@
 # From https://www.libarchive.de/downloads/sha256sums
-sha256  b60d58d12632ecf1e8fad7316dc82c6b9738a35625746b47ecdcaf4aed176176  libarchive-3.4.2.tar.gz
+sha256  ee1e749213c108cb60d53147f18c31a73d6717d7e3d2481c157e1b34c881ea39  libarchive-3.4.3.tar.gz
 # Locally computed:
 sha256  e1e3d4ba9d0b0ccba333b5f5539f7c6c9a3ef3d57a96cd165d2c45eaa1cd026d  COPYING
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 4aabbea560..708ce637c2 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBARCHIVE_VERSION = 3.4.2
+LIBARCHIVE_VERSION = 3.4.3
 LIBARCHIVE_SITE = https://www.libarchive.de/downloads
 LIBARCHIVE_INSTALL_STAGING = YES
 LIBARCHIVE_LICENSE = BSD-2-Clause, BSD-3-Clause, CC0-1.0, OpenSSL, Apache-2.0
