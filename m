From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Fri, 29 Oct 2010 20:06:24 +0200
Subject: [Buildroot] [git commit master 1/1] libtool: bump to 2.2.10
Message-ID: <20101029181142.B13EA8D41D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ccdf2580d8a7b619b1515b2058c5debc2a2d885d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libtool/libtool.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libtool/libtool.mk b/package/libtool/libtool.mk
index a996876..b57bca9 100644
--- a/package/libtool/libtool.mk
+++ b/package/libtool/libtool.mk
@@ -3,7 +3,7 @@
 # libtool
 #
 #############################################################
-LIBTOOL_VERSION = 1.5.24
+LIBTOOL_VERSION = 2.2.10
 LIBTOOL_SOURCE = libtool-$(LIBTOOL_VERSION).tar.gz
 LIBTOOL_SITE = $(BR2_GNU_MIRROR)/libtool
 
-- 
1.7.1
