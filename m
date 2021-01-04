From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 4 Jan 2021 21:29:45 +0100
Subject: [Buildroot] [git commit] package/libarchive: bump to version 3.5.1
Message-ID: <20210104201256.DE80A81243@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e3fc6f63f1f6d1248e14a4b9d9ac26fa32ce58fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Libarchive 3.5.1 is a bugfix release.

Update COPYRIGHT hash due to clarification about 'archive_entry.c' source
file:

 - https://github.com/libarchive/libarchive/commit/fde4660d7bda7debe8e6c8166d49fe9fa62db61d

Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libarchive/libarchive.hash | 4 ++--
 package/libarchive/libarchive.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
index 0660378097..bf0d6e4fdd 100644
--- a/package/libarchive/libarchive.hash
+++ b/package/libarchive/libarchive.hash
@@ -1,4 +1,4 @@
 # From https://www.libarchive.de/downloads/sha256sums
-sha256  ee1e749213c108cb60d53147f18c31a73d6717d7e3d2481c157e1b34c881ea39  libarchive-3.4.3.tar.gz
+sha256  9015d109ec00bb9ae1a384b172bf2fc1dff41e2c66e5a9eeddf933af9db37f5a  libarchive-3.5.1.tar.gz
 # Locally computed:
-sha256  e1e3d4ba9d0b0ccba333b5f5539f7c6c9a3ef3d57a96cd165d2c45eaa1cd026d  COPYING
+sha256  b2cdf763345de2de34cebf54394df3c61a105c3b71288603c251f2fa638200ba  COPYING
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 708ce637c2..1d4962cb20 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBARCHIVE_VERSION = 3.4.3
+LIBARCHIVE_VERSION = 3.5.1
 LIBARCHIVE_SITE = https://www.libarchive.de/downloads
 LIBARCHIVE_INSTALL_STAGING = YES
 LIBARCHIVE_LICENSE = BSD-2-Clause, BSD-3-Clause, CC0-1.0, OpenSSL, Apache-2.0
