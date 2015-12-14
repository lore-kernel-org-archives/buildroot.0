From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 14 Dec 2015 10:10:49 -0300
Subject: [Buildroot] [PATCH 10/45] libbsd: comma separate licenses
In-Reply-To: <1450098684-17399-1-git-send-email-gustavo@zacarias.com.ar>
References: <1450098684-17399-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1450098684-17399-11-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libbsd/libbsd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libbsd/libbsd.mk b/package/libbsd/libbsd.mk
index d6481b2..99a9572 100644
--- a/package/libbsd/libbsd.mk
+++ b/package/libbsd/libbsd.mk
@@ -7,7 +7,7 @@
 LIBBSD_VERSION = 0.6.0
 LIBBSD_SOURCE = libbsd-$(LIBBSD_VERSION).tar.xz
 LIBBSD_SITE = http://libbsd.freedesktop.org/releases
-LIBBSD_LICENSE = BSD-3c MIT
+LIBBSD_LICENSE = BSD-3c, MIT
 LIBBSD_LICENSE_FILES = COPYING
 
 LIBBSD_INSTALL_STAGING = YES
-- 
2.4.10
