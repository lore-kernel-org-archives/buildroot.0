From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Jun 2014 15:55:27 -0300
Subject: [Buildroot] [PATCH 21/54] nasm: add license information
In-Reply-To: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403636160-11807-21-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/nasm/nasm.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/nasm/nasm.mk b/package/nasm/nasm.mk
index 18efa4a..b9077eb 100644
--- a/package/nasm/nasm.mk
+++ b/package/nasm/nasm.mk
@@ -5,8 +5,10 @@
 ################################################################################
 
 NASM_VERSION = 2.11.02
-NASM_SOURCE  = nasm-$(NASM_VERSION).tar.xz
-NASM_SITE    = http://www.nasm.us/pub/nasm/releasebuilds/$(NASM_VERSION)
+NASM_SOURCE = nasm-$(NASM_VERSION).tar.xz
+NASM_SITE = http://www.nasm.us/pub/nasm/releasebuilds/$(NASM_VERSION)
+NASM_LICENSE = BSD-2c
+NASM_LICENSE_FILES = LICENSE
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
1.8.5.5
