From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 15 Mar 2018 21:39:47 +0200
Subject: [Buildroot] [PATCH] e2fsprogs: bump to version 1.44.0
Message-ID: <52388290ff425d03c8b59aed379dcc75d599a083.1521142787.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/e2fsprogs/e2fsprogs.hash | 4 ++--
 package/e2fsprogs/e2fsprogs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/e2fsprogs/e2fsprogs.hash b/package/e2fsprogs/e2fsprogs.hash
index 3def51f95bc7..812dfbe32011 100644
--- a/package/e2fsprogs/e2fsprogs.hash
+++ b/package/e2fsprogs/e2fsprogs.hash
@@ -1,5 +1,5 @@
-# From https://www.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.43.9/sha256sums.asc
-sha256 926f8e8de1ffba55d791f21b71334e8a32b5227257ad370f2bf7e4396629e97f  e2fsprogs-1.43.9.tar.xz
+# From https://www.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.44.0/sha256sums.asc
+sha256 a3567042f03fcee0e01db8f923b24cec92e2ba5b11f8e39e245672ad5392723d  e2fsprogs-1.44.0.tar.xz
 # Locally calculated
 sha256 680f852df303874fe9c722283a7da571ae9a0477768df8af1e363298e2adc51e  NOTICE
 sha256 032989b508f1a72ebee5b3417e55d06d473f9ee203e45ab11864a7e49cdec63d  lib/ss/mit-sipb-copyright.h
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index 99019c731703..e9dff32abca1 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-E2FSPROGS_VERSION = 1.43.9
+E2FSPROGS_VERSION = 1.44.0
 E2FSPROGS_SOURCE = e2fsprogs-$(E2FSPROGS_VERSION).tar.xz
 E2FSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/tytso/e2fsprogs/v$(E2FSPROGS_VERSION)
 E2FSPROGS_LICENSE = GPL-2.0, MIT-like with advertising clause (libss and libet)
-- 
2.16.2
