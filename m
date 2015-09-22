From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Sep 2015 16:13:37 +0200
Subject: [Buildroot] [git commit] iw: bump to version 4.3
Message-ID: <20150922141350.60BC981972@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=84a2dd6e1685032e1c22aedb66c02fe989878ab3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/iw/iw.hash |    2 +-
 package/iw/iw.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iw/iw.hash b/package/iw/iw.hash
index 02f9a52..424a71e 100644
--- a/package/iw/iw.hash
+++ b/package/iw/iw.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/software/network/iw/sha256sums.asc
-sha256	5164aaacd8e82501d84a2187af194e8285a5a5b76e200447eb58d4dd78d1a34b	iw-4.1.tar.xz
+sha256	a6add81a51667649d8d7cfba783ab6a0f82e250a663a4065b13babdff3f6b220	iw-4.3.tar.xz
diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index 2766850..3c1767a 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IW_VERSION = 4.1
+IW_VERSION = 4.3
 IW_SOURCE = iw-$(IW_VERSION).tar.xz
 IW_SITE = $(BR2_KERNEL_MIRROR)/software/network/iw
 IW_LICENSE = iw license
