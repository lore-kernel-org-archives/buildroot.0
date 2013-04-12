From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 12 Apr 2013 09:15:22 -0300
Subject: [Buildroot] [PATCH 3/4] jquery-validation: bump to version 1.11.1
In-Reply-To: <1365768923-28232-1-git-send-email-gustavo@zacarias.com.ar>
References: <1365768923-28232-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1365768923-28232-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/jquery-validation/jquery-validation.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/jquery-validation/jquery-validation.mk b/package/jquery-validation/jquery-validation.mk
index 746b534..423d7f1 100644
--- a/package/jquery-validation/jquery-validation.mk
+++ b/package/jquery-validation/jquery-validation.mk
@@ -1,6 +1,7 @@
-JQUERY_VALIDATION_VERSION = 1.10.0
+JQUERY_VALIDATION_VERSION = 1.11.1
 JQUERY_VALIDATION_SITE = http://jquery.bassistance.de/validate
 JQUERY_VALIDATION_SOURCE = jquery-validation-$(JQUERY_VALIDATION_VERSION).zip
+JQUERY_VALIDATION_LICENSE = MIT
 
 define JQUERY_VALIDATION_EXTRACT_CMDS
 	unzip -d $(@D) $(DL_DIR)/$(JQUERY_VALIDATION_SOURCE)
-- 
1.8.1.5
