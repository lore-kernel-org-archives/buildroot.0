From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 11 Jan 2014 16:42:15 +0100
Subject: [Buildroot] [pkg-luarocks infra v7 13/15] rings: bump to version
	1.3.0
In-Reply-To: <1389454937-13494-1-git-send-email-francois.perrad@gadz.org>
References: <1389454937-13494-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1389454937-13494-14-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/rings/rings.mk |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/rings/rings.mk b/package/rings/rings.mk
index c23f879..d052f5d 100644
--- a/package/rings/rings.mk
+++ b/package/rings/rings.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-RINGS_VERSION = 1.2.3-2
+RINGS_VERSION = 1.3.0-1
+RINGS_SUBDIR  = rings-v_1_3_0
 RINGS_LICENSE = MIT
 
 $(eval $(luarocks-package))
-- 
1.7.9.5
