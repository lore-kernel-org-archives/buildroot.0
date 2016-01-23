From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Fri, 22 Jan 2016 20:10:56 -0500
Subject: [Buildroot] [PATCH 03/18] erlang-goldrush: bump to version 0.1.8
In-Reply-To: <1453511471-28519-1-git-send-email-fhunleth@troodon-software.com>
References: <1453511471-28519-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <1453511471-28519-4-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 package/erlang-goldrush/erlang-goldrush.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/erlang-goldrush/erlang-goldrush.mk b/package/erlang-goldrush/erlang-goldrush.mk
index b18a8ec..2fa8810 100644
--- a/package/erlang-goldrush/erlang-goldrush.mk
+++ b/package/erlang-goldrush/erlang-goldrush.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_GOLDRUSH_VERSION = 0.1.6
+ERLANG_GOLDRUSH_VERSION = 0.1.8
 ERLANG_GOLDRUSH_SITE = $(call github,DeadZen,goldrush,$(ERLANG_GOLDRUSH_VERSION))
 ERLANG_GOLDRUSH_LICENSE = ISC
 ERLANG_GOLDRUSH_LICENSE_FILES = LICENSE
-- 
2.5.0
