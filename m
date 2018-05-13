From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 May 2018 23:00:58 +0200
Subject: [Buildroot] [git commit branch/next] zstd: bump to version 1.3.4
Message-ID: <20180513210022.C2F538A43B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4c32dc466a377b2ae8d52dbc131e668e6872b46c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Cc: Andrey Smirnov <andrew.smirnov@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/zstd/zstd.hash | 2 +-
 package/zstd/zstd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zstd/zstd.hash b/package/zstd/zstd.hash
index 51e5fc245c..f7aadfb5db 100644
--- a/package/zstd/zstd.hash
+++ b/package/zstd/zstd.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256 a77c47153ee7de02626c5b2a097005786b71688be61e9fb81806a011f90b297b zstd-v1.3.3.tar.gz
+sha256 92e41b6e8dd26bbd46248e8aa1d86f1551bc221a796277ae9362954f26d605a9 zstd-v1.3.4.tar.gz
 
 # License files (locally computed as well)
 sha256 2c1a7fa704df8f3a606f6fc010b8b5aaebf403f3aeec339a12048f1ba7331a0b LICENSE
diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index c74c8f24b6..4915cee07d 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZSTD_VERSION = v1.3.3
+ZSTD_VERSION = v1.3.4
 ZSTD_SITE = $(call github,facebook,zstd,$(ZSTD_VERSION))
 ZSTD_INSTALL_STAGING = YES
 ZSTD_LICENSE = BSD-3-Clause or GPL-2.0
