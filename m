From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Tue,  3 Mar 2015 09:41:12 +0100
Subject: [Buildroot] [PATCH 2/5] libass: change tarball compression to xz
In-Reply-To: <1425372075-22985-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1425372075-22985-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1425372075-22985-2-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/libass/libass.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libass/libass.mk b/package/libass/libass.mk
index 2b734c8..056ea8b 100644
--- a/package/libass/libass.mk
+++ b/package/libass/libass.mk
@@ -5,6 +5,7 @@
 ################################################################################
 
 LIBASS_VERSION = 0.10.2
+LIBASS_SOURCE = libass-$(LIBASS_VERSION).tar.xz
 LIBASS_SITE = http://libass.googlecode.com/files
 LIBASS_INSTALL_STAGING = YES
 LIBASS_LICENSE = ISC
-- 
1.9.1
