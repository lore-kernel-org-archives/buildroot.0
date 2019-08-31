From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 31 Aug 2019 23:03:59 +0300
Subject: [Buildroot] [PATCH next] package/iw: bump to version 5.3
Message-ID: <360ec37a29bc10ed69a23b3d345486206505f7cd.1567281839.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/iw/iw.hash | 2 +-
 package/iw/iw.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iw/iw.hash b/package/iw/iw.hash
index a85989ece80c..458262b7128e 100644
--- a/package/iw/iw.hash
+++ b/package/iw/iw.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/network/iw/sha256sums.asc
-sha256	1e38ea794a223525b2ea7fe78fd14f2a56121e62e21ba5f9dbe8c494b35b5c0d	iw-5.0.1.tar.xz
+sha256	04afe857bc8dea67e461946de30ae1b012954b6965839c5c3fda7d0ed15505d5	iw-5.3.tar.xz
 # Locally calculated
 sha256	5932fb70481e128940168a5fdf133e6454293c0865c7e757874b235cb6daa2af	COPYING
diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index 858874211171..fae65f739dca 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IW_VERSION = 5.0.1
+IW_VERSION = 5.3
 IW_SOURCE = iw-$(IW_VERSION).tar.xz
 IW_SITE = $(BR2_KERNEL_MIRROR)/software/network/iw
 IW_LICENSE = ISC
-- 
2.23.0.rc1
