From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 19 May 2016 09:29:49 -0300
Subject: [Buildroot] [PATCH] lft: switch to upstream provided URL
Message-ID: <1463660989-20934-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/lft/lft.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/lft/lft.mk b/package/lft/lft.mk
index 9128618..631704f 100644
--- a/package/lft/lft.mk
+++ b/package/lft/lft.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 LFT_VERSION = 3.74
-# Download from pwhois.org is form-wrapped resulting in ugly filename
-LFT_SITE = https://fossies.org/linux/privat
+LFT_SITE = http://pwhois.org/get
 LFT_DEPENDENCIES = libpcap
 LFT_LICENSE = VOSTROM
 LFT_LICENSE_FILES = COPYING
-- 
2.7.3
