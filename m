From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 23 Jun 2018 22:42:24 +0200
Subject: [Buildroot] [git commit] package/pcre: bump version to 8.42
Message-ID: <20180623204033.6A38781ECE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=63e7fea0bdbc122c7d146079a3653dc64f594fb7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated license hash after upstream commit
https://vcs.pcre.org/pcre/code/tags/pcre-8.42/LICENCE?r1=1674&r2=1726

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pcre/pcre.hash | 4 ++--
 package/pcre/pcre.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pcre/pcre.hash b/package/pcre/pcre.hash
index fc0bb98d05..ca72a78cd2 100644
--- a/package/pcre/pcre.hash
+++ b/package/pcre/pcre.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256 e62c7eac5ae7c0e7286db61ff82912e1c0b7a0c13706616e94a7dd729321b530  pcre-8.41.tar.bz2
+sha256 2cd04b7c887808be030254e8d77de11d3fe9d4505c39d4b15d2664ffe8bf9301  pcre-8.42.tar.bz2
 # License files, locally calculated
-sha256 9ac4dfc82b2645ff77b56b759f95f28aa15ab15a03670fa6d4313a6b351e60f0  LICENCE
+sha256 f998c0f52eb704eff28f503580cfca3f2547280aa212994f6cf2d8e317587c1c  LICENCE
diff --git a/package/pcre/pcre.mk b/package/pcre/pcre.mk
index b12b00dd66..163e535ec3 100644
--- a/package/pcre/pcre.mk
+++ b/package/pcre/pcre.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCRE_VERSION = 8.41
+PCRE_VERSION = 8.42
 PCRE_SITE = https://ftp.pcre.org/pub/pcre
 PCRE_SOURCE = pcre-$(PCRE_VERSION).tar.bz2
 PCRE_LICENSE = BSD-3-Clause
