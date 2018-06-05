From: Baruch Siach <baruch@tkos.co.il>
Date: Tue,  5 Jun 2018 15:30:49 +0300
Subject: [Buildroot] [PATCH] e2fsprogs: bump to version 1.44.2
Message-ID: <1f17a0353652d55e763625f5b3d0d1c5bd67500a.1528201849.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update license file hash; FSF address update.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/e2fsprogs/e2fsprogs.hash | 6 +++---
 package/e2fsprogs/e2fsprogs.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/e2fsprogs/e2fsprogs.hash b/package/e2fsprogs/e2fsprogs.hash
index 60498db8e4ac..65a6e199c989 100644
--- a/package/e2fsprogs/e2fsprogs.hash
+++ b/package/e2fsprogs/e2fsprogs.hash
@@ -1,6 +1,6 @@
-# From https://www.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.44.1/sha256sums.asc
-sha256 0ca164c1c87724df904c918b2d7051ef989b51de725db66c67514dbe6dd2b9ef  e2fsprogs-1.44.1.tar.xz
+# From https://www.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.44.2/sha256sums.asc
+sha256 8324cf0b6e81805a741d94087b00e99f7e16144f1ee5a413709a1fa6948b126c  e2fsprogs-1.44.2.tar.xz
 # Locally calculated
-sha256 680f852df303874fe9c722283a7da571ae9a0477768df8af1e363298e2adc51e  NOTICE
+sha256 5da5ef153e559c1d990d4c3eedbedd4442db892d37eae1f35fff069de8ec9020  NOTICE
 sha256 032989b508f1a72ebee5b3417e55d06d473f9ee203e45ab11864a7e49cdec63d  lib/ss/mit-sipb-copyright.h
 sha256 47182fe6631a32f271a15bbe210751b3825b7199f588879aac7d4804fc8b4b8f  lib/et/internal.h
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index ce7736c1cd78..316546a8d733 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-E2FSPROGS_VERSION = 1.44.1
+E2FSPROGS_VERSION = 1.44.2
 E2FSPROGS_SOURCE = e2fsprogs-$(E2FSPROGS_VERSION).tar.xz
 E2FSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/tytso/e2fsprogs/v$(E2FSPROGS_VERSION)
 E2FSPROGS_LICENSE = GPL-2.0, MIT-like with advertising clause (libss and libet)
-- 
2.17.1
