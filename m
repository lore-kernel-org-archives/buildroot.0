From: unixmania at gmail.com <unixmania@gmail.com>
Date: Mon, 21 Oct 2019 14:03:59 -0300
Subject: [Buildroot] [PATCH] package/sysvinit: bump to version 2.96
Message-ID: <20191021170359.16818-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 package/sysvinit/sysvinit.hash | 2 +-
 package/sysvinit/sysvinit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sysvinit/sysvinit.hash b/package/sysvinit/sysvinit.hash
index 2161fb38bd..c1d9f94461 100644
--- a/package/sysvinit/sysvinit.hash
+++ b/package/sysvinit/sysvinit.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256	114cffc8ef514a38b9916de2050bb6d73b43dff7afd05aee6b09d2f6cea7664e  sysvinit-2.90.tar.xz
+sha256	2a2e26b72aa235a23ab1c8471005f890309ce1196c83fbc9413c57b9ab62b587  sysvinit-2.96.tar.xz
 
 # Hash for license files:
 sha256	ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
index 98aa5a417b..98a37fc760 100644
--- a/package/sysvinit/sysvinit.mk
+++ b/package/sysvinit/sysvinit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSVINIT_VERSION = 2.90
+SYSVINIT_VERSION = 2.96
 SYSVINIT_SOURCE = sysvinit-$(SYSVINIT_VERSION).tar.xz
 SYSVINIT_SITE = http://download.savannah.nongnu.org/releases/sysvinit
 SYSVINIT_LICENSE = GPL-2.0+
-- 
2.18.1
