From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 May 2017 15:06:46 +0200
Subject: [Buildroot] [git commit] package/exfat-utils: bump version to 1.2.6
Message-ID: <20170601202858.45E5782A3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8847227411d3382b82e7bcec86bdc8baadc32e41
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/exfat-utils/exfat-utils.hash | 2 +-
 package/exfat-utils/exfat-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/exfat-utils/exfat-utils.hash b/package/exfat-utils/exfat-utils.hash
index b40e632..f0d6b64 100644
--- a/package/exfat-utils/exfat-utils.hash
+++ b/package/exfat-utils/exfat-utils.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	6aa51926416b9d0977b456902f4c4cd10bcce4b2d160859a7a2fc9ca6bcbbb11	exfat-utils-1.2.4.tar.gz
+sha256 b96b6692cf92a629c9eca0fe8c782646e20479524c7d2a99b7e9b43c3cf8ac43  exfat-utils-1.2.6.tar.gz
diff --git a/package/exfat-utils/exfat-utils.mk b/package/exfat-utils/exfat-utils.mk
index 622c181..c1b5a93 100644
--- a/package/exfat-utils/exfat-utils.mk
+++ b/package/exfat-utils/exfat-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXFAT_UTILS_VERSION = 1.2.4
+EXFAT_UTILS_VERSION = 1.2.6
 EXFAT_UTILS_SITE = https://github.com/relan/exfat/releases/download/v$(EXFAT_UTILS_VERSION)
 EXFAT_UTILS_LICENSE = GPL-3.0+
 EXFAT_UTILS_LICENSE_FILES = COPYING
