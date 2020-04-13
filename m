From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 13 Apr 2020 14:53:05 +0200
Subject: [Buildroot] [PATCH 3/3] package/sdparm: bump version to 1.11
In-Reply-To: <20200413125305.881053-1-bernd.kuhls@t-online.de>
References: <20200413125305.881053-1-bernd.kuhls@t-online.de>
Message-ID: <20200413125305.881053-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes: https://www.spinics.net/lists/linux-scsi/msg139073.html

Updated license according to release notes:

   - update BSD license from 3 to 2 clause aka FreeBSD
     license (without reference to FreeBSD project)

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/sdparm/sdparm.hash | 2 +-
 package/sdparm/sdparm.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sdparm/sdparm.hash b/package/sdparm/sdparm.hash
index 22d6b5b87b..a44d94d261 100644
--- a/package/sdparm/sdparm.hash
+++ b/package/sdparm/sdparm.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7dc9e148cef22744e00809dad21b59ac544e3615001bc1b2399978f73e1d58ca  sdparm-1.10.tar.xz
+sha256  483931fc636794d898549706ae247d7cfdd047a9b517b7d856ff102e386112db  sdparm-1.11.tar.xz
 sha256  4f98444e14adb18a94a65c3ded5f0dad42d382c6a2288b593a2d5bd5ecc4f46d  COPYING
diff --git a/package/sdparm/sdparm.mk b/package/sdparm/sdparm.mk
index b9fac518c8..59a32820ff 100644
--- a/package/sdparm/sdparm.mk
+++ b/package/sdparm/sdparm.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-SDPARM_VERSION = 1.10
+SDPARM_VERSION = 1.11
 SDPARM_SOURCE = sdparm-$(SDPARM_VERSION).tar.xz
 SDPARM_SITE = http://sg.danny.cz/sg/p
-SDPARM_LICENSE = BSD-3-Clause
+SDPARM_LICENSE = BSD-2-Clause
 SDPARM_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_SG3_UTILS),y)
-- 
2.25.0
