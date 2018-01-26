From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Jan 2018 13:39:08 +0100
Subject: [Buildroot] [git commit] libbsd: bump to version 0.8.7
Message-ID: <20180126124345.2EC2B83C7F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9c5419c09a1a525bb0d304f62624ccecd4cb2d03
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Change download site; the latest version is not on the official site.

Add license hash.

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libbsd/libbsd.hash | 5 +++--
 package/libbsd/libbsd.mk   | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/libbsd/libbsd.hash b/package/libbsd/libbsd.hash
index bc6c7cf..133df90 100644
--- a/package/libbsd/libbsd.hash
+++ b/package/libbsd/libbsd.hash
@@ -1,2 +1,3 @@
-# Locally calculated after checking pgp signature
-sha256	934b634f4dfd865b6482650b8f522c70ae65c463529de8be907b53c89c3a34a8	libbsd-0.8.3.tar.xz
+# From https://lists.freedesktop.org/archives/libbsd/2018-January/000166.html
+sha256	f548f10e5af5a08b1e22889ce84315b1ebe41505b015c9596bad03fd13a12b31	libbsd-0.8.7.tar.xz
+sha256	0b6cedd686394f9c811a6a9fd314d68ab4738475ad3d9df61154259fa649a2a7	COPYING
diff --git a/package/libbsd/libbsd.mk b/package/libbsd/libbsd.mk
index eba25d7..e211389 100644
--- a/package/libbsd/libbsd.mk
+++ b/package/libbsd/libbsd.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBBSD_VERSION = 0.8.3
+LIBBSD_VERSION = 0.8.7
 LIBBSD_SOURCE = libbsd-$(LIBBSD_VERSION).tar.xz
-LIBBSD_SITE = http://libbsd.freedesktop.org/releases
+LIBBSD_SITE = https://archive.hadrons.org/software/libbsd
 LIBBSD_LICENSE = BSD-3-Clause, MIT
 LIBBSD_LICENSE_FILES = COPYING
 LIBBSD_INSTALL_STAGING = YES
