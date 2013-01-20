From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Jan 2013 20:22:35 +0100
Subject: [Buildroot] [PATCH 6/8] libogg: add license informations
In-Reply-To: <1358709757-1929-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1358709757-1929-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1358709757-1929-6-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libogg/libogg.mk |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/libogg/libogg.mk b/package/libogg/libogg.mk
index 519ba9d..606c004 100644
--- a/package/libogg/libogg.mk
+++ b/package/libogg/libogg.mk
@@ -5,8 +5,10 @@
 #############################################################
 LIBOGG_VERSION = 1.3.0
 LIBOGG_SITE = http://downloads.xiph.org/releases/ogg
-LIBOGG_INSTALL_STAGING = YES
+LIBOGG_LICENSE = BSD-3c
+LIBOGG_LICENSE_FILES = COPYING
 
+LIBOGG_INSTALL_STAGING = YES
 LIBOGG_DEPENDENCIES = host-pkgconf
 
 $(eval $(autotools-package))
-- 
1.7.9.5
