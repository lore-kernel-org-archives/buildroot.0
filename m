From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 4 Sep 2019 21:36:55 +0200
Subject: [Buildroot] [git commit] package/iw: bump to version 5.3
Message-ID: <20190904194020.3519B8B525@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e287b7c5f9fd2770defa14e699f2d9e807dc1322
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iw/iw.hash | 2 +-
 package/iw/iw.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iw/iw.hash b/package/iw/iw.hash
index a85989ece8..458262b712 100644
--- a/package/iw/iw.hash
+++ b/package/iw/iw.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/network/iw/sha256sums.asc
-sha256	1e38ea794a223525b2ea7fe78fd14f2a56121e62e21ba5f9dbe8c494b35b5c0d	iw-5.0.1.tar.xz
+sha256	04afe857bc8dea67e461946de30ae1b012954b6965839c5c3fda7d0ed15505d5	iw-5.3.tar.xz
 # Locally calculated
 sha256	5932fb70481e128940168a5fdf133e6454293c0865c7e757874b235cb6daa2af	COPYING
diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index 8588742111..fae65f739d 100644
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
