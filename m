From: Martin Banky <martin.banky@gmail.com>
Date: Sun, 26 Sep 2010 00:19:59 -0700
Subject: [Buildroot] [PATCH 4/4] autoconf: bump to 2.68
In-Reply-To: <1285485599-29412-1-git-send-email-Martin.Banky@gmail.com>
References: <1285485599-29412-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1285485599-29412-4-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 package/autoconf/autoconf.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/autoconf/autoconf.mk b/package/autoconf/autoconf.mk
index b1fc52d..9630550 100644
--- a/package/autoconf/autoconf.mk
+++ b/package/autoconf/autoconf.mk
@@ -3,7 +3,7 @@
 # autoconf
 #
 #############################################################
-AUTOCONF_VERSION = 2.67
+AUTOCONF_VERSION = 2.68
 AUTOCONF_SOURCE = autoconf-$(AUTOCONF_VERSION).tar.bz2
 AUTOCONF_SITE = $(BR2_GNU_MIRROR)/autoconf
 
-- 
1.7.3
