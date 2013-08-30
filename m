From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 30 Aug 2013 18:57:21 -0300
Subject: [Buildroot] [PATCH 5/5] iw: bump to version 3.11
In-Reply-To: <1377899841-26206-1-git-send-email-gustavo@zacarias.com.ar>
References: <1377899841-26206-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1377899841-26206-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/iw/iw.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index c8d9561..566308c 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IW_VERSION = 3.10
+IW_VERSION = 3.11
 IW_SOURCE = iw-$(IW_VERSION).tar.bz2
 IW_SITE = $(BR2_KERNEL_MIRROR)/software/network/iw
 IW_LICENSE = iw license
-- 
1.8.1.5
