From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 30 Nov 2012 22:46:29 +0100
Subject: [Buildroot] [PATCH v2] fluxbox: add license info
In-Reply-To: <1354311995-21598-1-git-send-email-s.martin49@gmail.com>
References: <1354311995-21598-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1354311995-21598-3-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
v2: fix license according to Arnout's comments
---
 package/fluxbox/fluxbox.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/fluxbox/fluxbox.mk b/package/fluxbox/fluxbox.mk
index 15136c9..356c5a2 100644
--- a/package/fluxbox/fluxbox.mk
+++ b/package/fluxbox/fluxbox.mk
@@ -7,6 +7,8 @@
 FLUXBOX_VERSION = 1.3.2
 FLUXBOX_SOURCE = fluxbox-$(FLUXBOX_VERSION).tar.bz2
 FLUXBOX_SITE = http://downloads.sourceforge.net/project/fluxbox/fluxbox/$(FLUXBOX_VERSION)
+FLUXBOX_LICENSE = MIT
+FLUXBOX_LICENSE_FILES = COPYING
 
 FLUXBOX_CONF_OPT = --x-includes=$(STAGING_DIR)/usr/include/X11 \
 		   --x-libraries=$(STAGING_DIR)/usr/lib
-- 
1.8.0.1
