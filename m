From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 25 Feb 2021 07:55:59 +0200
Subject: [Buildroot] [PATCH next] package/uhubctl: bump to version 2.4.0
Message-ID: <d567a0559b444d7f4b5bc8aaa0754987b3511be6.1614232559.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add COPYING license text to _LICENSE_FILES.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/uhubctl/uhubctl.hash | 3 ++-
 package/uhubctl/uhubctl.mk   | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/uhubctl/uhubctl.hash b/package/uhubctl/uhubctl.hash
index c137088772df..c696d70f6cd2 100644
--- a/package/uhubctl/uhubctl.hash
+++ b/package/uhubctl/uhubctl.hash
@@ -1,3 +1,4 @@
 # Locally computed
-sha256  714f733592d3cb6ba8efc84fbc03b1beed2323918ff33aef01cdb956755be7b7  uhubctl-2.3.0.tar.gz
+sha256  391f24fd1f89cacce801df38ecc289b34c3627bc08ee69eec515af7e1a283d97  uhubctl-2.4.0.tar.gz
 sha256  2d3aa0737e8db9dfd710f9a282b446cb7b15b2b3eecac383f0c45c64d736eea0  LICENSE
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/uhubctl/uhubctl.mk b/package/uhubctl/uhubctl.mk
index 08efca092c54..3429d7d151e8 100644
--- a/package/uhubctl/uhubctl.mk
+++ b/package/uhubctl/uhubctl.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-UHUBCTL_VERSION = 2.3.0
+UHUBCTL_VERSION = 2.4.0
 UHUBCTL_SITE = $(call github,mvp,uhubctl,v$(UHUBCTL_VERSION))
 UHUBCTL_LICENSE = GPL-2.0
-UHUBCTL_LICENSE_FILES = LICENSE
+UHUBCTL_LICENSE_FILES = LICENSE COPYING
 UHUBCTL_DEPENDENCIES = libusb
 
 define UHUBCTL_BUILD_CMDS
-- 
2.30.0
