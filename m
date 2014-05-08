From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  8 May 2014 13:52:27 -0300
Subject: [Buildroot] [PATCH 1/3] fping: bump to version 3.10
Message-ID: <1399567949-3832-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/fping/fping.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/fping/fping.mk b/package/fping/fping.mk
index a87f85d..0045bef 100644
--- a/package/fping/fping.mk
+++ b/package/fping/fping.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FPING_VERSION = 3.9
+FPING_VERSION = 3.10
 FPING_SITE = http://fping.org/dist
 FPING_LICENSE = BSD-like
 FPING_LICENSE_FILES = COPYING
-- 
1.8.5.5
