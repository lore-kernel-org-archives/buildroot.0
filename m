From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jun 2014 16:20:39 -0300
Subject: [Buildroot] [PATCH 11/53] fconfig: add license information
In-Reply-To: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403810481-10025-11-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/fconfig/fconfig.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/fconfig/fconfig.mk b/package/fconfig/fconfig.mk
index 2288e79..ee741d7 100644
--- a/package/fconfig/fconfig.mk
+++ b/package/fconfig/fconfig.mk
@@ -6,6 +6,8 @@
 
 FCONFIG_VERSION = 20080329
 FCONFIG_SITE = http://andrzejekiert.ovh.org/software/fconfig/
+FCONFIG_LICENSE = GPLv2+
+FCONFIG_LICENSE_FILES = fconfig.c
 
 define FCONFIG_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
-- 
1.8.5.5
