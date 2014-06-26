From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jun 2014 16:20:50 -0300
Subject: [Buildroot] [PATCH 22/53] jsmin: add license information
In-Reply-To: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403810481-10025-22-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/jsmin/jsmin.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/jsmin/jsmin.mk b/package/jsmin/jsmin.mk
index 3ef3047..957b686 100644
--- a/package/jsmin/jsmin.mk
+++ b/package/jsmin/jsmin.mk
@@ -6,6 +6,8 @@
 
 JSMIN_VERSION = a9b47554d5684a55301a2eb7ca8480b7ee7630d4
 JSMIN_SITE = $(call github,douglascrockford,JSMin,$(JSMIN_VERSION))
+JSMIN_LICENSE = MIT
+JSMIN_LICENSE_FILES = jsmin.c
 
 define JSMIN_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) jsmin
-- 
1.8.5.5
