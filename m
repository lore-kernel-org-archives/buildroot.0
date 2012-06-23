From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 23 Jun 2012 08:29:59 -0300
Subject: [Buildroot] [PATCH 3/5] gzip: bump to version 1.5
In-Reply-To: <1340451001-7111-1-git-send-email-gustavo@zacarias.com.ar>
References: <1340451001-7111-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1340451001-7111-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gzip/gzip.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gzip/gzip.mk b/package/gzip/gzip.mk
index f712f98..5fad001 100644
--- a/package/gzip/gzip.mk
+++ b/package/gzip/gzip.mk
@@ -3,8 +3,8 @@
 # gzip
 #
 #############################################################
-GZIP_VERSION:=1.4
-GZIP_SOURCE:=gzip-$(GZIP_VERSION).tar.gz
-GZIP_SITE:=$(BR2_GNU_MIRROR)/gzip
+
+GZIP_VERSION = 1.5
+GZIP_SITE = $(BR2_GNU_MIRROR)/gzip
 
 $(eval $(call AUTOTARGETS))
-- 
1.7.3.4
