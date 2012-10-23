From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 23 Oct 2012 10:18:10 -0300
Subject: [Buildroot] [PATCH 1/2] bison: bump to version 2.6.3
Message-ID: <1350998291-31932-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/bison/bison.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/bison/bison.mk b/package/bison/bison.mk
index 8c33a7a..c93f716 100644
--- a/package/bison/bison.mk
+++ b/package/bison/bison.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-BISON_VERSION = 2.6.2
+BISON_VERSION = 2.6.3
 BISON_SITE = $(BR2_GNU_MIRROR)/bison
 BISON_LICENSE = GPLv3+
 BISON_LICENSE_FILES = COPYING
-- 
1.7.8.6
