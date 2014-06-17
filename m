From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 17 Jun 2014 16:44:09 -0300
Subject: [Buildroot] [PATCH 2/2] opus-tools: bump to version 0.1.9
In-Reply-To: <1403034249-17668-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403034249-17668-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403034249-17668-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/opus-tools/opus-tools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/opus-tools/opus-tools.mk b/package/opus-tools/opus-tools.mk
index 06dc5d4..e314eef 100644
--- a/package/opus-tools/opus-tools.mk
+++ b/package/opus-tools/opus-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPUS_TOOLS_VERSION = 0.1.8
+OPUS_TOOLS_VERSION = 0.1.9
 OPUS_TOOLS_SITE = http://downloads.xiph.org/releases/opus
 OPUS_TOOLS_LICENSE = BSD-2c
 OPUS_TOOLS_LICENSE_FILES = COPYING
-- 
1.8.5.5
