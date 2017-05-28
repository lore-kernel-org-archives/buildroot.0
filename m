From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 May 2017 15:06:42 +0200
Subject: [Buildroot] [git commit] package/exfat: bump version to 1.2.6
Message-ID: <20170601202858.36CE982641@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b9101f89a9920518bb9ccef782d19d35d8a2d49b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/exfat/exfat.hash | 2 +-
 package/exfat/exfat.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/exfat/exfat.hash b/package/exfat/exfat.hash
index cf3aab1..15b67f0 100644
--- a/package/exfat/exfat.hash
+++ b/package/exfat/exfat.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	9312d23a5d82543ad2e9ab7f0a0b471aea53eeb8eae664451c881b46d849756e	fuse-exfat-1.2.4.tar.gz
+sha256 e1105256d75860c0678f98bbae0b8fe465d4c96ed187b7035556097f152478e7  fuse-exfat-1.2.6.tar.gz
diff --git a/package/exfat/exfat.mk b/package/exfat/exfat.mk
index ae89217..f5ed13e 100644
--- a/package/exfat/exfat.mk
+++ b/package/exfat/exfat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXFAT_VERSION = 1.2.4
+EXFAT_VERSION = 1.2.6
 EXFAT_SITE = https://github.com/relan/exfat/releases/download/v$(EXFAT_VERSION)
 EXFAT_SOURCE = fuse-exfat-$(EXFAT_VERSION).tar.gz
 EXFAT_DEPENDENCIES = libfuse host-pkgconf
