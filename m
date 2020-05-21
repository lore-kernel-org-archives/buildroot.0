From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 21 May 2020 15:18:41 +0200
Subject: [Buildroot] [git commit] package/libpwquality: bump version to 1.4.2
Message-ID: <20200602200121.335E18256A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7c16bf544953004f8a534ae447189ed90161e1cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Stefan S??rensen <stefan.sorensen@spectralink.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libpwquality/libpwquality.hash | 4 ++--
 package/libpwquality/libpwquality.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libpwquality/libpwquality.hash b/package/libpwquality/libpwquality.hash
index b63501fa16..07c50ed24e 100644
--- a/package/libpwquality/libpwquality.hash
+++ b/package/libpwquality/libpwquality.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	a97d72b5c56b7e279c6e86dad70c1493ea5796f00a596fb9f3173b96f9bf5e46	libpwquality-1.4.1.tar.bz2
-sha256	aa44d09f651bf99b56253187c7778a240740c767d28453ab7fdc9804c842baee	COPYING
+sha256  5263e09ee62269c092f790ac159112aed3e66826a795e3afec85fdeac4281c8e  libpwquality-1.4.2.tar.bz2
+sha256  aa44d09f651bf99b56253187c7778a240740c767d28453ab7fdc9804c842baee  COPYING
diff --git a/package/libpwquality/libpwquality.mk b/package/libpwquality/libpwquality.mk
index bddafd59ca..a2fb00415f 100644
--- a/package/libpwquality/libpwquality.mk
+++ b/package/libpwquality/libpwquality.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPWQUALITY_VERSION = 1.4.1
+LIBPWQUALITY_VERSION = 1.4.2
 LIBPWQUALITY_SOURCE = libpwquality-$(LIBPWQUALITY_VERSION).tar.bz2
 LIBPWQUALITY_SITE = https://github.com/libpwquality/libpwquality/releases/download/libpwquality-$(LIBPWQUALITY_VERSION)
 LIBPWQUALITY_LICENSE = BSD-3-Clause or GPL-2.0+
