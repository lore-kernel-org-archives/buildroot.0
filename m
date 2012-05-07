From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon,  7 May 2012 22:43:09 +0200
Subject: [Buildroot] [PATCH 5/8] libosip2: remove redundant LIBOSIP2_SOURCE
	definition
In-Reply-To: <1336423392-8673-1-git-send-email-luca@lucaceresoli.net>
References: <1336423392-8673-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1336423392-8673-6-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/libosip2/libosip2.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/libosip2/libosip2.mk b/package/libosip2/libosip2.mk
index 1d53f76..2cde27f 100644
--- a/package/libosip2/libosip2.mk
+++ b/package/libosip2/libosip2.mk
@@ -5,7 +5,6 @@
 #############################################################
 
 LIBOSIP2_VERSION = 3.6.0
-LIBOSIP2_SOURCE = libosip2-$(LIBOSIP2_VERSION).tar.gz
 LIBOSIP2_SITE = $(BR2_GNU_MIRROR)/osip
 LIBOSIP2_INSTALL_STAGING = YES
 
-- 
1.7.5.4
