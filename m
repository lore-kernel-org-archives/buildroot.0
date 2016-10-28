From: Joel Stanley <joel@jms.id.au>
Date: Fri, 28 Oct 2016 13:24:04 +1030
Subject: [Buildroot] [PATCH 1/2] linux-firmware: Bump version
Message-ID: <20161028025405.26098-1-joel@jms.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 package/linux-firmware/linux-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 8d8b7b2da163..38bced643fbb 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_FIRMWARE_VERSION = c4c07a8d1128d50a5c2885ceea1abbebaa82f820
+LINUX_FIRMWARE_VERSION = a179db97914da5e650c21ba8f9b0bae04a0f8a41
 LINUX_FIRMWARE_SITE = http://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
 LINUX_FIRMWARE_SITE_METHOD = git
 
-- 
2.9.3
