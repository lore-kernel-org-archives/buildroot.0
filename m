From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 5 Apr 2021 09:32:35 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/nettle: bump
 version to 3.6
Message-ID: <20210405072152.A59F486D29@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eed984e34a693e49e9f17a1c4863a458c454db17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Release notes:
https://git.lysator.liu.se/nettle/nettle/-/blob/master/NEWS

Reformatted hashes.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 01632805ab4be2bea4010ba1e46ab71f52d175a9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nettle/nettle.hash | 8 ++++----
 package/nettle/nettle.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/nettle/nettle.hash b/package/nettle/nettle.hash
index 1e13aab411..1bbc1c6d22 100644
--- a/package/nettle/nettle.hash
+++ b/package/nettle/nettle.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/nettle/nettle-3.5.1.tar.gz.sig
-sha256	75cca1998761b02e16f2db56da52992aef622bf55a3b45ec538bc2eedadc9419	nettle-3.5.1.tar.gz
+# https://ftp.gnu.org/gnu/nettle/nettle-3.6.tar.gz.sig
+sha256  d24c0d0f2abffbc8f4f34dcf114b0f131ec3774895f3555922fe2f40f3d5e3f1  nettle-3.6.tar.gz
 # Locally calculated
-sha256	a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c	COPYING.LESSERv3
-sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYINGv2
+sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING.LESSERv3
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYINGv2
diff --git a/package/nettle/nettle.mk b/package/nettle/nettle.mk
index 380d167521..50ebdc706b 100644
--- a/package/nettle/nettle.mk
+++ b/package/nettle/nettle.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETTLE_VERSION = 3.5.1
+NETTLE_VERSION = 3.6
 NETTLE_SITE = http://www.lysator.liu.se/~nisse/archive
 NETTLE_DEPENDENCIES = gmp
 NETTLE_INSTALL_STAGING = YES
