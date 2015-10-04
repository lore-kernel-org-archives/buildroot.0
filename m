From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 4 Oct 2015 13:28:55 +0100
Subject: [Buildroot] [PATCH v2 15/18] Makefile.in: remove now-unused
	TARGET_CC/CXX_NOCCACHE
In-Reply-To: <1443961738-12149-1-git-send-email-arnout@mind.be>
References: <1443961738-12149-1-git-send-email-arnout@mind.be>
Message-ID: <1443961738-12149-16-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Romain Naour <romain.naour@openwide.fr>
---
v2: No change
---
 package/Makefile.in | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 4b1ce7f..7dc0eac 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -186,9 +186,6 @@ TARGET_READELF  = $(TARGET_CROSS)readelf
 TARGET_OBJCOPY  = $(TARGET_CROSS)objcopy
 TARGET_OBJDUMP  = $(TARGET_CROSS)objdump
 
-TARGET_CC_NOCCACHE  := $(TARGET_CC)
-TARGET_CXX_NOCCACHE := $(TARGET_CXX)
-
 ifeq ($(BR2_STRIP_strip),y)
 STRIP_STRIP_DEBUG := --strip-debug
 STRIP_STRIP_UNNEEDED := --strip-unneeded
-- 
2.5.3
