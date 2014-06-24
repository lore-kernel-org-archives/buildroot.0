From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Jun 2014 15:55:42 -0300
Subject: [Buildroot] [PATCH 36/54] socketcand: add license information
In-Reply-To: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403636160-11807-36-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/socketcand/socketcand.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/socketcand/socketcand.mk b/package/socketcand/socketcand.mk
index fdba96e..51aa224 100644
--- a/package/socketcand/socketcand.mk
+++ b/package/socketcand/socketcand.mk
@@ -7,6 +7,7 @@
 SOCKETCAND_VERSION = 274e4e44107f6138a29bbc4e20f9fbd2a7d4dab1
 SOCKETCAND_SITE = $(call github,dschanoeh,socketcand,$(SOCKETCAND_VERSION))
 SOCKETCAND_AUTORECONF = YES
+SOCKETCAND_LICENSE = BSD-3c or GPLv2
 
 ifeq ($(BR2_PACKAGE_LIBCONFIG),y)
 SOCKETCAND_DEPENDENCIES = libconfig
-- 
1.8.5.5
