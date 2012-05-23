From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 23 May 2012 10:29:36 -0300
Subject: [Buildroot] [PATCH 4/7] libidn: bump to version 1.25
In-Reply-To: <1337779779-1783-1-git-send-email-gustavo@zacarias.com.ar>
References: <1337779779-1783-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1337779779-1783-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libidn/libidn.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libidn/libidn.mk b/package/libidn/libidn.mk
index 935240b..6d2bea6 100644
--- a/package/libidn/libidn.mk
+++ b/package/libidn/libidn.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBIDN_VERSION = 1.24
+LIBIDN_VERSION = 1.25
 LIBIDN_SITE = $(BR2_GNU_MIRROR)/libidn
 LIBIDN_INSTALL_STAGING = YES
 LIBIDN_CONF_ENV = EMACS="no"
-- 
1.7.3.4
