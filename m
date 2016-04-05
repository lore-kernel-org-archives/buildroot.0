From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Apr 2016 21:37:02 +0200
Subject: [Buildroot] [git commit] package/libshout: bump version to 2.4.1
Message-ID: <20160405194002.076D6804F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4c5a5c7ea8d1c470bf4057e524439ed2bf199e2b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libshout/libshout.hash | 5 +++--
 package/libshout/libshout.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libshout/libshout.hash b/package/libshout/libshout.hash
index 908bd99..5b3ae2d 100644
--- a/package/libshout/libshout.hash
+++ b/package/libshout/libshout.hash
@@ -1,2 +1,3 @@
-# From http://downloads.xiph.org/releases/libshout/SHA256SUMS
-sha256	cf3c5f6b4a5e3fcfbe09fb7024aa88ad4099a9945f7cb037ec06bcee7a23926e	libshout-2.3.1.tar.gz
+# From https://gitweb.gentoo.org/repo/gentoo.git/tree/media-libs/libshout/Manifest
+# hash from http://downloads.xiph.org/releases/libshout/SHA256SUMS is wrong!
+sha256	f3acb8dec26f2dbf6df778888e0e429a4ce9378a9d461b02a7ccbf2991bbf24d	libshout-2.4.1.tar.gz
diff --git a/package/libshout/libshout.mk b/package/libshout/libshout.mk
index faee3eb..029c134 100644
--- a/package/libshout/libshout.mk
+++ b/package/libshout/libshout.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSHOUT_VERSION = 2.3.1
+LIBSHOUT_VERSION = 2.4.1
 LIBSHOUT_SITE = http://downloads.xiph.org/releases/libshout
 LIBSHOUT_LICENSE = LGPLv2+
 LIBSHOUT_LICENSE_FILES = COPYING
