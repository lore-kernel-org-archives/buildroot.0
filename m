From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon,  7 May 2012 22:43:06 +0200
Subject: [Buildroot] [PATCH 2/8] libogg: remove redundant LIBOGG_SOURCE
	definition
In-Reply-To: <1336423392-8673-1-git-send-email-luca@lucaceresoli.net>
References: <1336423392-8673-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1336423392-8673-3-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/libogg/libogg.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/libogg/libogg.mk b/package/libogg/libogg.mk
index c40f04e..c3d4897 100644
--- a/package/libogg/libogg.mk
+++ b/package/libogg/libogg.mk
@@ -4,7 +4,6 @@
 #
 #############################################################
 LIBOGG_VERSION = 1.3.0
-LIBOGG_SOURCE = libogg-$(LIBOGG_VERSION).tar.gz
 LIBOGG_SITE = http://downloads.xiph.org/releases/ogg
 LIBOGG_INSTALL_STAGING = YES
 
-- 
1.7.5.4
