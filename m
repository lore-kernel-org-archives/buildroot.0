From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 5 Mar 2020 21:13:45 +0100
Subject: [Buildroot] [git commit] package/libite: bump version to 2.1.2
Message-ID: <20200309140909.16024821F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=486da6067dbe7511634af6b2e9ca29edc446e3eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The hash for LICENSE has changed due to the copyright being updated and
the note about licensing types has been moved to the bottom.

The hash for chomp.c has been changed due to the copyright being updated and
code changes in that file.

Changelog:
https://github.com/troglobit/libite/releases/tag/v2.1.2

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libite/libite.hash | 13 +++++++------
 package/libite/libite.mk   |  2 +-
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/libite/libite.hash b/package/libite/libite.hash
index db3f6232b2..e16e78c01f 100644
--- a/package/libite/libite.hash
+++ b/package/libite/libite.hash
@@ -1,7 +1,8 @@
-# From https://github.com/troglobit/libite/releases/download/v2.1.0/libite-2.1.0.tar.xz.md5
-md5 701aa509f27ee35156bc53601e69fa74  libite-2.1.0.tar.xz
+# From https://github.com/troglobit/libite/releases/download/v2.1.2/libite-2.1.2.tar.xz.md5
+md5  3c23186dec3f3ae135ec4e8b58581f4e  libite-2.1.2.tar.xz
+
 # Locally calculated
-sha256 cf56e720146243749e0af5763d4a84eef738e20f2bef2d867497fefc39dee991  libite-2.1.0.tar.xz
-sha256 0e97ab27b60e20a7ddb8e9638189ad159124e51d2c12e12735b05423df224da5  LICENSE
-sha256 9e0fb98d251dddf5ba81a355f6b4d89835ec53bc5d7f5fcd2c866b54ec5ccec8  src/chomp.c
-sha256 a7d29c148e057fae11a87febc3a51970a26433c35a08fc710be689394442d32d  src/pidfile.c
+sha256  7a16825c6d02040767ccb9f3faed4bf0e6841857a46cc4cb9e9f36b78a6c7cb3  libite-2.1.2.tar.xz
+sha256  dc6eae50f69af0e848fd6957cdf48895563b4d15fdde7c9d20ae2bfdefbc2b83  LICENSE
+sha256  89053891d46d04a21d4a492f68038703e179986baffa458201810f4222b57427  src/chomp.c
+sha256  a7d29c148e057fae11a87febc3a51970a26433c35a08fc710be689394442d32d  src/pidfile.c
diff --git a/package/libite/libite.mk b/package/libite/libite.mk
index c598da1b4a..62fc0df00a 100644
--- a/package/libite/libite.mk
+++ b/package/libite/libite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBITE_VERSION = 2.1.0
+LIBITE_VERSION = 2.1.2
 LIBITE_SOURCE = libite-$(LIBITE_VERSION).tar.xz
 LIBITE_SITE = https://github.com/troglobit/libite/releases/download/v$(LIBITE_VERSION)
 LIBITE_LICENSE = MIT, X11, ISC, BSD-2-Clause
