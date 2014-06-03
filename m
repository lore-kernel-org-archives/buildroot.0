From: Kim De Mey <kim.demey@gmail.com>
Date: Tue,  3 Jun 2014 14:52:30 +0200
Subject: [Buildroot] [PATCH 1/1] libcgroup: bump to version 0.41 and use
	LIBCGROUP_VERSION
Message-ID: <1401799950-15116-1-git-send-email-kim.demey@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Kim De Mey <kim.demey@gmail.com>
---
 package/libcgroup/libcgroup.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcgroup/libcgroup.mk b/package/libcgroup/libcgroup.mk
index 0ef1e91..b8e4047 100644
--- a/package/libcgroup/libcgroup.mk
+++ b/package/libcgroup/libcgroup.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LIBCGROUP_VERSION = 0.38
+LIBCGROUP_VERSION = 0.41
 LIBCGROUP_SOURCE = libcgroup-$(LIBCGROUP_VERSION).tar.bz2
-LIBCGROUP_SITE = http://downloads.sourceforge.net/project/libcg/libcgroup/v.038
+LIBCGROUP_SITE = http://downloads.sourceforge.net/project/libcg/libcgroup/v$(LIBCGROUP_VERSION)
 LIBCGROUP_LICENSE = LGPLv2.1
 LIBCGROUP_LICENSE_FILES = COPYING
 LIBCGROUP_DEPENDENCIES = host-bison host-flex
-- 
1.7.1
