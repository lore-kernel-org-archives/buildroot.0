From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:20:54 +0200
Subject: [Buildroot] [PATCH 25/69] libtool: add explicit dependencies for
	host variant
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-26-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/libtool/libtool.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libtool/libtool.mk b/package/libtool/libtool.mk
index 8688f8b20cc4..1d066bd1ec06 100644
--- a/package/libtool/libtool.mk
+++ b/package/libtool/libtool.mk
@@ -10,6 +10,7 @@ LIBTOOL_SITE = $(BR2_GNU_MIRROR)/libtool
 LIBTOOL_INSTALL_STAGING = YES
 LIBTOOL_CONF_ENV = HELP2MAN=true
 LIBTOOL_DEPENDENCIES = host-m4
+HOST_LIBTOOL_DEPENDENCIES = host-m4
 LIBTOOL_LICENSE = GPLv2+
 LIBTOOL_LICENSE_FILES = COPYING
 
-- 
2.1.0
