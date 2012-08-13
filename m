From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 13 Aug 2012 10:14:30 -0300
Subject: [Buildroot] [PATCH 2/2] coreutils: bump to version 8.18
In-Reply-To: <1344863670-7129-1-git-send-email-gustavo@zacarias.com.ar>
References: <1344863670-7129-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1344863670-7129-2-git-send-email-gustavo@zacarias.com.ar>
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
index e64dd5a..d7d0779 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-COREUTILS_VERSION = 8.16
+COREUTILS_VERSION = 8.18
 COREUTILS_SITE = $(BR2_GNU_MIRROR)/coreutils
 COREUTILS_SOURCE = coreutils-$(COREUTILS_VERSION).tar.xz
 
-- 
1.7.8.6
