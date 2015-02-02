From: Francois Perrad <fperrad@gmail.com>
Date: Mon,  2 Feb 2015 20:52:43 +0100
Subject: [Buildroot] [PATCH 3/3] ljlinenoise: bump to version 0.1.2
In-Reply-To: <1422906763-13919-1-git-send-email-francois.perrad@gadz.org>
References: <1422906763-13919-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1422906763-13919-3-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/ljlinenoise/ljlinenoise.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ljlinenoise/ljlinenoise.mk b/package/ljlinenoise/ljlinenoise.mk
index 868f319..aca6358 100644
--- a/package/ljlinenoise/ljlinenoise.mk
+++ b/package/ljlinenoise/ljlinenoise.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LJLINENOISE_VERSION_UPSTREAM = 0.1.1
+LJLINENOISE_VERSION_UPSTREAM = 0.1.2
 LJLINENOISE_VERSION = $(LJLINENOISE_VERSION_UPSTREAM)-1
 LJLINENOISE_SUBDIR = ljlinenoise-$(LJLINENOISE_VERSION_UPSTREAM)
 LJLINENOISE_LICENSE = MIT
-- 
2.1.0
