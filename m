From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 28 Mar 2012 23:24:58 -0300
Subject: [Buildroot] [PATCH 2/7] coreutils: bump to version 8.16
In-Reply-To: <1332987903-12378-1-git-send-email-gustavo@zacarias.com.ar>
References: <1332987903-12378-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1332987903-12378-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/coreutils/coreutils.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 0a85586..b2cca39 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-COREUTILS_VERSION = 8.15
+COREUTILS_VERSION = 8.16
 COREUTILS_SITE = $(BR2_GNU_MIRROR)/coreutils
 COREUTILS_SOURCE = coreutils-$(COREUTILS_VERSION).tar.xz
 
-- 
1.7.3.4
