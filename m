From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Jun 2014 15:55:20 -0300
Subject: [Buildroot] [PATCH 14/54] libiqrf: add license information
In-Reply-To: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403636160-11807-14-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libiqrf/libiqrf.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libiqrf/libiqrf.mk b/package/libiqrf/libiqrf.mk
index ec0d599..0531602 100644
--- a/package/libiqrf/libiqrf.mk
+++ b/package/libiqrf/libiqrf.mk
@@ -7,7 +7,7 @@
 LIBIQRF_VERSION = v0.1.2
 LIBIQRF_SITE = $(call github,nandra,libiqrf,$(LIBIQRF_VERSION))
 LIBIQRF_INSTALL_STAGING = YES
-
 LIBIQRF_DEPENDENCIES = libusb
+LIBIQRF_LICENSE = LGPLv2.1+
 
 $(eval $(cmake-package))
-- 
1.8.5.5
