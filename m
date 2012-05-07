From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon,  7 May 2012 22:43:11 +0200
Subject: [Buildroot] [PATCH 7/8] libeXosip2: remove redundant
	LIBOSIP2_SOURCE definition
In-Reply-To: <1336423392-8673-1-git-send-email-luca@lucaceresoli.net>
References: <1336423392-8673-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1336423392-8673-8-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/libeXosip2/libeXosip2.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/libeXosip2/libeXosip2.mk b/package/libeXosip2/libeXosip2.mk
index 4b778a9..24ca7ce 100644
--- a/package/libeXosip2/libeXosip2.mk
+++ b/package/libeXosip2/libeXosip2.mk
@@ -5,7 +5,6 @@
 #############################################################
 
 LIBEXOSIP2_VERSION = 3.6.0
-LIBEXOSIP2_SOURCE = libeXosip2-$(LIBEXOSIP2_VERSION).tar.gz
 LIBEXOSIP2_SITE = http://download.savannah.gnu.org/releases/exosip/
 LIBEXOSIP2_INSTALL_STAGING = YES
 
-- 
1.7.5.4
