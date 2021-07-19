From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Jul 2021 23:03:02 +0200
Subject: [Buildroot] [git commit] package/libidn: bump to version 1.37
Message-ID: <20210719203514.0555D835C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=d10d5f7fcd5d89a9589dce078941b03fc9eeffa6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://gitlab.com/libidn/libidn/-/blob/v1.37/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libidn/libidn.hash | 2 +-
 package/libidn/libidn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libidn/libidn.hash b/package/libidn/libidn.hash
index 0255a63950..6269465e1c 100644
--- a/package/libidn/libidn.hash
+++ b/package/libidn/libidn.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  14b67108344d81ba844631640df77c9071d9fb0659b080326ff5424e86b14038  libidn-1.36.tar.gz
+sha256  3c8e970d5cd80a8cb56f59c61611535336343942e3f1c81b0190c69993a692c2  libidn-1.37.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYINGv2
diff --git a/package/libidn/libidn.mk b/package/libidn/libidn.mk
index c49bbe098e..2180607a89 100644
--- a/package/libidn/libidn.mk
+++ b/package/libidn/libidn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBIDN_VERSION = 1.36
+LIBIDN_VERSION = 1.37
 LIBIDN_SITE = $(BR2_GNU_MIRROR)/libidn
 LIBIDN_INSTALL_STAGING = YES
 LIBIDN_CONF_ENV = EMACS="no" MAKEINFO=true
