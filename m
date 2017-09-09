From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 9 Sep 2017 22:01:48 +0200
Subject: [Buildroot] [git commit] s6-networking: bump version to 2.3.0.2
Message-ID: <20170909195854.6ECF181014@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=452706bb9682172c4fb0fa935135c3c97cd9fa66
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/s6-networking/s6-networking.hash | 2 +-
 package/s6-networking/s6-networking.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/s6-networking/s6-networking.hash b/package/s6-networking/s6-networking.hash
index 44c4657..3ba64b1 100644
--- a/package/s6-networking/s6-networking.hash
+++ b/package/s6-networking/s6-networking.hash
@@ -1,2 +1,2 @@
 # Locally generated
-sha256 67c4beab39377b60bb996000a336c764adf4b5456c0283a8fd27657b15e9c6d6  s6-networking-2.3.0.1.tar.gz
+sha256 d81968756abbcecde6a872c89d82f643cd621a0c295c2c57650705dbe875481a  s6-networking-2.3.0.2.tar.gz
diff --git a/package/s6-networking/s6-networking.mk b/package/s6-networking/s6-networking.mk
index 6463f5d..7c9f087 100644
--- a/package/s6-networking/s6-networking.mk
+++ b/package/s6-networking/s6-networking.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_NETWORKING_VERSION = 2.3.0.1
+S6_NETWORKING_VERSION = 2.3.0.2
 S6_NETWORKING_SITE = http://skarnet.org/software/s6-networking
 S6_NETWORKING_LICENSE = ISC
 S6_NETWORKING_LICENSE_FILES = COPYING
