From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Aug 2018 20:26:57 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/pound: bump version to 2.8
Message-ID: <20180819182657.19155-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
www.apsis.ch/pound/pound_list/archive/2018/2018-05/1526034164000

Added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/pound/pound.hash | 3 ++-
 package/pound/pound.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/pound/pound.hash b/package/pound/pound.hash
index 6908b9060c..7fbf01b89b 100644
--- a/package/pound/pound.hash
+++ b/package/pound/pound.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256	cdfbf5a7e8dc8fbbe0d6c1e83cd3bd3f2472160aac65684bb01ef661c626a8e4	Pound-2.7.tgz
+sha256 a7fd8690de0fd390615e79fd0f4bfd56a544b8ef97dd6659c07ecd3207480c25  Pound-2.8.tgz
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  GPL.txt
diff --git a/package/pound/pound.mk b/package/pound/pound.mk
index 6f7cc848f8..9a62cf7a58 100644
--- a/package/pound/pound.mk
+++ b/package/pound/pound.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POUND_VERSION = 2.7
+POUND_VERSION = 2.8
 POUND_SITE = http://www.apsis.ch/pound
 POUND_SOURCE = Pound-$(POUND_VERSION).tgz
 POUND_LICENSE = GPL-3.0+
-- 
2.18.0
