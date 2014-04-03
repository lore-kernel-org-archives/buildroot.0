From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  3 Apr 2014 21:01:06 +0200
Subject: [Buildroot] [PATCH v4 11/37] nasm: version bump 2.11.02
In-Reply-To: <1396551692-12371-1-git-send-email-bernd.kuhls@t-online.de>
References: <1396551692-12371-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1396551692-12371-12-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/nasm/nasm.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nasm/nasm.mk b/package/nasm/nasm.mk
index d8045da..18efa4a 100644
--- a/package/nasm/nasm.mk
+++ b/package/nasm/nasm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NASM_VERSION = 2.10.01
+NASM_VERSION = 2.11.02
 NASM_SOURCE  = nasm-$(NASM_VERSION).tar.xz
 NASM_SITE    = http://www.nasm.us/pub/nasm/releasebuilds/$(NASM_VERSION)
 
-- 
1.7.10.4
