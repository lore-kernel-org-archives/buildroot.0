From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 17 Sep 2014 18:19:21 +0100
Subject: [Buildroot] [PATCH 1/3] iprutils: bump version to 2.4.2
Message-ID: <1410974363-43368-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/iprutils/iprutils.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/iprutils/iprutils.mk b/package/iprutils/iprutils.mk
index 48934d0..53516b6 100644
--- a/package/iprutils/iprutils.mk
+++ b/package/iprutils/iprutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPRUTILS_VERSION = 2.3.15
+IPRUTILS_VERSION = 2.4.2
 IPRUTILS_SITE = http://downloads.sourceforge.net/project/iprdd/iprutils%20for%202.6%20kernels/$(IPRUTILS_VERSION)
 IPRUTILS_SOURCE = iprutils-$(IPRUTILS_VERSION)-src.tgz
 IPRUTILS_DEPENDENCIES = ncurses libsysfs pciutils
-- 
1.7.1
