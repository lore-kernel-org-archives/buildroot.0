From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Oct 2010 13:35:01 +0200
Subject: [Buildroot] [PATCH 06/12] libtool: bump to 2.2.10
In-Reply-To: <cover.1287833623.git.thomas.petazzoni@free-electrons.com>
References: <cover.1287833623.git.thomas.petazzoni@free-electrons.com>
Message-ID: <ccdf2580d8a7b619b1515b2058c5debc2a2d885d.1287833623.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

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
1.7.0.4
