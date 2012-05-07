From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon,  7 May 2012 22:43:05 +0200
Subject: [Buildroot] [PATCH 1/8] speex: remove redundant SPEEX_SOURCE
	definition
In-Reply-To: <1336423392-8673-1-git-send-email-luca@lucaceresoli.net>
References: <1336423392-8673-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1336423392-8673-2-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also fix Makefile coding style

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/speex/speex.mk |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/speex/speex.mk b/package/speex/speex.mk
index c9d9ed3..2d8a255 100644
--- a/package/speex/speex.mk
+++ b/package/speex/speex.mk
@@ -3,9 +3,8 @@
 # speex
 #
 #############################################################
-SPEEX_VERSION=1.2rc1
-SPEEX_SOURCE=speex-$(SPEEX_VERSION).tar.gz
-SPEEX_SITE=http://downloads.us.xiph.org/releases/speex
+SPEEX_VERSION = 1.2rc1
+SPEEX_SITE = http://downloads.us.xiph.org/releases/speex
 SPEEX_INSTALL_STAGING = YES
 SPEEX_DEPENDENCIES = libogg
 SPEEX_CONF_OPT = --with-ogg-libraries=$(STAGING_DIR)/usr/lib \
-- 
1.7.5.4
