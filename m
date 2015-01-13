From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 13 Jan 2015 14:36:06 +0200
Subject: [Buildroot] [PATCH 2/3] libgtk2: remove redundant INSTALL_TARGET
In-Reply-To: <b6614b5357753ff8a3580e80936d8fd19e0857bd.1421152567.git.baruch@tkos.co.il>
References: <b6614b5357753ff8a3580e80936d8fd19e0857bd.1421152567.git.baruch@tkos.co.il>
Message-ID: <6a9db83ea9e7f5a55c6d4cdf80d68383aeca04b1.1421152567.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

INSTALL_TARGET defaults to YES.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libgtk2/libgtk2.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index eeb56f5c78e2..dfc1f5b86a8d 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -10,7 +10,6 @@ LIBGTK2_VERSION = $(LIBGTK2_VERSION_MAJOR).18
 LIBGTK2_SOURCE = gtk+-$(LIBGTK2_VERSION).tar.xz
 LIBGTK2_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK2_VERSION_MAJOR)
 LIBGTK2_INSTALL_STAGING = YES
-LIBGTK2_INSTALL_TARGET = YES
 LIBGTK2_LICENSE = LGPLv2+
 LIBGTK2_LICENSE_FILES = COPYING
 
-- 
2.1.4
