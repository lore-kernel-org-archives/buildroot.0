From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Jan 2019 23:05:59 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] libxml2: bump to version
 2.9.8
Message-ID: <20190129220527.9C4C98154B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=74aac9385792e22a586b2255293e7d90cdf0f9e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 889d904f8ad85ad3aeb6bf696a2f125c9deeb44e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libxml2/libxml2.hash | 2 +-
 package/libxml2/libxml2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libxml2/libxml2.hash b/package/libxml2/libxml2.hash
index f7e046bff6..d114d98060 100644
--- a/package/libxml2/libxml2.hash
+++ b/package/libxml2/libxml2.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256	f63c5e7d30362ed28b38bfa1ac6313f9a80230720b7fb6c80575eeab3ff5900c	libxml2-2.9.7.tar.gz
+sha256	0b74e51595654f958148759cfef0993114ddccccbb6f31aee018f3558e8e2732	libxml2-2.9.8.tar.gz
 # License files, locally calculated
 sha256	c5c63674f8a83c4d2e385d96d1c670a03cb871ba2927755467017317878574bd	COPYING
diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index a6285a6946..06a802eb10 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXML2_VERSION = 2.9.7
+LIBXML2_VERSION = 2.9.8
 LIBXML2_SITE = ftp://xmlsoft.org/libxml2
 LIBXML2_INSTALL_STAGING = YES
 LIBXML2_LICENSE = MIT
