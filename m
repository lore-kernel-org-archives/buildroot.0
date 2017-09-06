From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Sep 2017 22:14:43 +0200
Subject: [Buildroot] [git commit] scons: bump to version 2.5.1
Message-ID: <20170906201134.AE54882167@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5f20f984017c79e261f9187ab93b6346a7f6e1d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/scons/scons.hash | 2 +-
 package/scons/scons.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/scons/scons.hash b/package/scons/scons.hash
index 1b47d64..b3cdea0 100644
--- a/package/scons/scons.hash
+++ b/package/scons/scons.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  9442069999cf4b2caa94a5886ab4c2c71de1718ed5e9176c18e2b6dbca463b4b  scons-2.3.0.tar.gz
+sha256  0b25218ae7b46a967db42f2a53721645b3d42874a65f9552ad16ce26d30f51f2  scons-2.5.1.tar.gz
diff --git a/package/scons/scons.mk b/package/scons/scons.mk
index c56526c..14be589 100644
--- a/package/scons/scons.mk
+++ b/package/scons/scons.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SCONS_VERSION = 2.3.0
+SCONS_VERSION = 2.5.1
 SCONS_SITE = http://downloads.sourceforge.net/project/scons/scons/$(SCONS_VERSION)
 SCONS_LICENSE = MIT
 SCONS_LICENSE_FILES = LICENSE.txt
