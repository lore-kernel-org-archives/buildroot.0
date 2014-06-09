From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Jun 2014 19:59:42 +0200
Subject: [Buildroot] [git commit] libcgicc: bump to version 3.2.15
Message-ID: <20140609175953.9985D9CF25@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=04807fc26fb43518f79829a616034b4f1acce11b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libcgicc/libcgicc.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libcgicc/libcgicc.mk b/package/libcgicc/libcgicc.mk
index 945c435..d146dab 100644
--- a/package/libcgicc/libcgicc.mk
+++ b/package/libcgicc/libcgicc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCGICC_VERSION = 3.2.14
+LIBCGICC_VERSION = 3.2.15
 LIBCGICC_SITE = $(BR2_GNU_MIRROR)/cgicc
 LIBCGICC_SOURCE = cgicc-$(LIBCGICC_VERSION).tar.gz
 LIBCGICC_LICENSE = LGPLv3+ (library), GFDL1.2+ (docs)
