From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Jul 2017 23:33:01 +0200
Subject: [Buildroot] [git commit] s6-networking: bump version to 2.3.0.1
Message-ID: <20170702213031.CD52981F02@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9d80d7fc4f261773f1f3211b1c29ef795f1624ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/s6-networking/s6-networking.hash | 2 +-
 package/s6-networking/s6-networking.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/s6-networking/s6-networking.hash b/package/s6-networking/s6-networking.hash
index a15efab..44c4657 100644
--- a/package/s6-networking/s6-networking.hash
+++ b/package/s6-networking/s6-networking.hash
@@ -1,2 +1,2 @@
 # Locally generated
-sha256 5d8150d7413b335693c6e63092381dd0866b1b6f95662a2cbae5ec17ca449ab0 s6-networking-2.2.1.0.tar.gz
+sha256 67c4beab39377b60bb996000a336c764adf4b5456c0283a8fd27657b15e9c6d6  s6-networking-2.3.0.1.tar.gz
diff --git a/package/s6-networking/s6-networking.mk b/package/s6-networking/s6-networking.mk
index 47d4d61..ffaf8bc 100644
--- a/package/s6-networking/s6-networking.mk
+++ b/package/s6-networking/s6-networking.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_NETWORKING_VERSION = 2.2.1.0
+S6_NETWORKING_VERSION = 2.3.0.1
 S6_NETWORKING_SITE = http://skarnet.org/software/s6-networking
 S6_NETWORKING_LICENSE = ISC
 S6_NETWORKING_LICENSE_FILES = COPYING
