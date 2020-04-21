From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Apr 2020 21:35:54 +0200
Subject: [Buildroot] [git commit] package/iw: bump to 5.4
Message-ID: <20200421192149.53BE78F126@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=036efac5bc6146fb2638fc302159bac8e645ffd9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/iw/iw.hash | 4 ++--
 package/iw/iw.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/iw/iw.hash b/package/iw/iw.hash
index 458262b712..0aa51563f1 100644
--- a/package/iw/iw.hash
+++ b/package/iw/iw.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/network/iw/sha256sums.asc
-sha256	04afe857bc8dea67e461946de30ae1b012954b6965839c5c3fda7d0ed15505d5	iw-5.3.tar.xz
+sha256  a2469f677088d7b1070a7fbb28f3c747041697e8f6ec70783339cb1bc27a395f  iw-5.4.tar.xz
 # Locally calculated
-sha256	5932fb70481e128940168a5fdf133e6454293c0865c7e757874b235cb6daa2af	COPYING
+sha256  5932fb70481e128940168a5fdf133e6454293c0865c7e757874b235cb6daa2af  COPYING
diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index fae65f739d..2250ea413b 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IW_VERSION = 5.3
+IW_VERSION = 5.4
 IW_SOURCE = iw-$(IW_VERSION).tar.xz
 IW_SITE = $(BR2_KERNEL_MIRROR)/software/network/iw
 IW_LICENSE = ISC
