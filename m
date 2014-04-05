From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  4 Apr 2014 21:12:37 -0300
Subject: [Buildroot] [PATCH 2/2] sg3_utils: bump to version 1.38
In-Reply-To: <1396656757-11271-1-git-send-email-gustavo@zacarias.com.ar>
References: <1396656757-11271-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1396656757-11271-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sg3_utils/sg3_utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sg3_utils/sg3_utils.mk b/package/sg3_utils/sg3_utils.mk
index be86bd7..4a08fd5 100644
--- a/package/sg3_utils/sg3_utils.mk
+++ b/package/sg3_utils/sg3_utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SG3_UTILS_VERSION = 1.37
+SG3_UTILS_VERSION = 1.38
 SG3_UTILS_SOURCE = sg3_utils-$(SG3_UTILS_VERSION).tar.xz
 SG3_UTILS_SITE  = http://sg.danny.cz/sg/p/
 SG3_UTILS_LICENSE = BSD-3c
-- 
1.8.3.2
