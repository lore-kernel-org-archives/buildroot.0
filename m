From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 24 Dec 2020 17:41:09 +0200
Subject: [Buildroot] [PATCH] package/uhubctl: bump to version 2.3.0
Message-ID: <53802dca659f5b61ddaa7c8012d11adf4bfbe720.1608824469.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/uhubctl/uhubctl.hash | 2 +-
 package/uhubctl/uhubctl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uhubctl/uhubctl.hash b/package/uhubctl/uhubctl.hash
index c477301c786e..c137088772df 100644
--- a/package/uhubctl/uhubctl.hash
+++ b/package/uhubctl/uhubctl.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e5a722cb41967903bedbab4eea566ab332241a7f05fc7bc9c386b9a5e1762d8b  uhubctl-2.2.0.tar.gz
+sha256  714f733592d3cb6ba8efc84fbc03b1beed2323918ff33aef01cdb956755be7b7  uhubctl-2.3.0.tar.gz
 sha256  2d3aa0737e8db9dfd710f9a282b446cb7b15b2b3eecac383f0c45c64d736eea0  LICENSE
diff --git a/package/uhubctl/uhubctl.mk b/package/uhubctl/uhubctl.mk
index 0633152cce94..08efca092c54 100644
--- a/package/uhubctl/uhubctl.mk
+++ b/package/uhubctl/uhubctl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UHUBCTL_VERSION = 2.2.0
+UHUBCTL_VERSION = 2.3.0
 UHUBCTL_SITE = $(call github,mvp,uhubctl,v$(UHUBCTL_VERSION))
 UHUBCTL_LICENSE = GPL-2.0
 UHUBCTL_LICENSE_FILES = LICENSE
-- 
2.29.2
