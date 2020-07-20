From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Jul 2020 18:04:16 +0200
Subject: [Buildroot] [git commit] package/bison: bump version to 3.6.4
Message-ID: <20200720160000.BF6E3821BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ff28afdcc35adfd4ad1fbf4be31a13b7a1664774
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also separate the fields in the hash file by two spaces.

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bison/bison.hash | 4 ++--
 package/bison/bison.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bison/bison.hash b/package/bison/bison.hash
index 01ee17d76e..9c3f32b4b4 100644
--- a/package/bison/bison.hash
+++ b/package/bison/bison.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256	27d05534699735dc69e86add5b808d6cb35900ad3fd63fa82e3eb644336abfa0	bison-3.4.2.tar.xz
+sha256  8b13473b31ca7fcf65e5e8a74224368ffd5df19275602a9c9567ba393f18577d  bison-3.6.4.tar.xz
 # License files, locally calculated
-sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/bison/bison.mk b/package/bison/bison.mk
index 4cc635c445..b73e9163ad 100644
--- a/package/bison/bison.mk
+++ b/package/bison/bison.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BISON_VERSION = 3.4.2
+BISON_VERSION = 3.6.4
 BISON_SOURCE = bison-$(BISON_VERSION).tar.xz
 BISON_SITE = $(BR2_GNU_MIRROR)/bison
 BISON_LICENSE = GPL-3.0+
