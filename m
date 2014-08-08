From: Sergey Alyoshin <alyoshin.s@gmail.com>
Date: Fri,  8 Aug 2014 13:00:20 +0400
Subject: [Buildroot] [PATCH 1/1] Change nanocom version to 1.0
Message-ID: <1407488420-31106-1-git-send-email-alyoshin.s@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sergey Alyoshin <alyoshin.s@gmail.com>
---
 package/nanocom/nanocom.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nanocom/nanocom.mk b/package/nanocom/nanocom.mk
index c2a9291..f723951 100644
--- a/package/nanocom/nanocom.mk
+++ b/package/nanocom/nanocom.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-NANOCOM_VERSION = 2.6.1
+NANOCOM_VERSION = 1.0
 NANOCOM_SOURCE = nanocom.tar.gz
-NANOCOM_SITE = http://downloads.sourceforge.net/project/nanocom/nanocom/v1.0
+NANOCOM_SITE = http://downloads.sourceforge.net/project/nanocom/nanocom/v$(NANOCOM_VERSION)
 NANOCOM_LICENSE = GPLv2+
 NANOCOM_LICENSE_FILES = COPYING
 
-- 
1.9.1
