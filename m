From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 28 Jun 2013 10:41:06 -0300
Subject: [Buildroot] [PATCH 09/19] fbgrab: define license
In-Reply-To: <1372426876-2258-1-git-send-email-gustavo@zacarias.com.ar>
References: <1372426876-2258-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1372426876-2258-9-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/fbgrab/fbgrab.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/fbgrab/fbgrab.mk b/package/fbgrab/fbgrab.mk
index 7645a6b..62539a8 100644
--- a/package/fbgrab/fbgrab.mk
+++ b/package/fbgrab/fbgrab.mk
@@ -8,6 +8,8 @@ FBGRAB_VERSION = 1.0
 FBGRAB_SOURCE = fbgrab-$(FBGRAB_VERSION).tar.gz
 FBGRAB_SITE = http://hem.bredband.net/gmogmo/fbgrab
 FBGRAB_DEPENDENCIES = libpng
+FBGRAB_LICENSE = GPLv2
+FBGRAB_LICENSE_FILES = COPYING
 
 define FBGRAB_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
-- 
1.8.1.5
