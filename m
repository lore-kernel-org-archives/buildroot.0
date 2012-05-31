From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 31 May 2012 11:33:00 -0000
Subject: [Buildroot] [git commit] speex: remove redundant SPEEX_SOURCE
	definition
Message-ID: <20120531113256.95BFB96E2B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=29e62eeb1ed9fb2a9c1b771e01a3248acd56d69c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also fix Makefile coding style

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
