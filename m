From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Sep 2019 23:22:02 +0200
Subject: [Buildroot] [git commit] package/terminology: bump to version 1.5.0
Message-ID: <20190923211804.00A878F1FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1149ba74f825c9aac4de974dbbac346f99c9dc71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See:
https://www.enlightenment.org/news/2019-07-20-terminology-1.5.0

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/terminology/terminology.hash | 4 ++--
 package/terminology/terminology.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/terminology/terminology.hash b/package/terminology/terminology.hash
index 45885ca301..64e7cd9aa2 100644
--- a/package/terminology/terminology.hash
+++ b/package/terminology/terminology.hash
@@ -1,3 +1,3 @@
-# From https://www.enlightenment.org/news/2019-05-24-terminology-1.4.1
-sha256  d7b8b35fa38cb6a8746435c44f3517c47324d4c8362b35878ec90c9254d9a956  terminology-1.4.1.tar.xz
+# From https://download.enlightenment.org/rel/apps/terminology/terminology-1.5.0.tar.xz.sha256sum
+sha256  de55e503b382bb7c42a7def04c5ef7bff01e3e1fb0b379a4591544899eab8a6c  terminology-1.5.0.tar.xz
 sha256  a907d434f4691990ed8f2826ff7546672e9934a26c798351da12ed544dadc628  COPYING
diff --git a/package/terminology/terminology.mk b/package/terminology/terminology.mk
index 633daf5a02..590413e69c 100644
--- a/package/terminology/terminology.mk
+++ b/package/terminology/terminology.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TERMINOLOGY_VERSION = 1.4.1
+TERMINOLOGY_VERSION = 1.5.0
 TERMINOLOGY_SOURCE = terminology-$(TERMINOLOGY_VERSION).tar.xz
 TERMINOLOGY_SITE = https://download.enlightenment.org/rel/apps/terminology
 TERMINOLOGY_LICENSE = BSD-2-Clause
