From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Feb 2021 10:26:15 +0100
Subject: [Buildroot] [git commit] package/libcoap: bump version
Message-ID: <20210207091615.ACD89807E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=975b7c68cb9847611e408b1cdbdc1bb977e72d6b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reformatted hashes, updated license hash due to copyright year bump:
https://github.com/obgm/libcoap/commit/12fd8a25f708aa45a20f61e363f127b934633668

Release notes:
https://sourceforge.net/p/libcoap/mailman/message/36801445/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcoap/libcoap.hash | 6 +++---
 package/libcoap/libcoap.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libcoap/libcoap.hash b/package/libcoap/libcoap.hash
index 579a052c8d..3472006224 100644
--- a/package/libcoap/libcoap.hash
+++ b/package/libcoap/libcoap.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 9523e38da6ee8b2a8f5ce83ded64107dd1e514c7ad00cd74ccfe3454b679c271 libcoap-4.2.0.tar.gz
-sha256 09dd86a017bad210527085008cbf706609c58210897b69845af14099577e7eb7 COPYING
-sha256 3821a9f881344ad53c543c84675ad4b6a29e913ca500cfa160ab52e4e6965b15 LICENSE
+sha256  29a0394a265d3febee41e5e2dc03d34292a0aede37f5f80334e529ac0dab2321  libcoap-4.2.1.tar.gz
+sha256  09dd86a017bad210527085008cbf706609c58210897b69845af14099577e7eb7  COPYING
+sha256  c51e85271aca3fbdd79bb4ee45dcfd854724538dad83b70afbbdfc62415e3e7f  LICENSE
diff --git a/package/libcoap/libcoap.mk b/package/libcoap/libcoap.mk
index bea0e68889..9a5e04d4fd 100644
--- a/package/libcoap/libcoap.mk
+++ b/package/libcoap/libcoap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCOAP_VERSION = 4.2.0
+LIBCOAP_VERSION = 4.2.1
 LIBCOAP_SITE = $(call github,obgm,libcoap,v$(LIBCOAP_VERSION))
 LIBCOAP_INSTALL_STAGING = YES
 LIBCOAP_LICENSE = BSD-2-Clause
