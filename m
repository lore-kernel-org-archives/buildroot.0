From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jun 2014 16:20:40 -0300
Subject: [Buildroot] [PATCH 12/53] feh: add license information
In-Reply-To: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403810481-10025-12-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/feh/feh.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/feh/feh.mk b/package/feh/feh.mk
index e63f89e..681fdc4 100644
--- a/package/feh/feh.mk
+++ b/package/feh/feh.mk
@@ -8,6 +8,8 @@ FEH_VERSION = 2.12
 FEH_SOURCE = feh-$(FEH_VERSION).tar.bz2
 FEH_SITE = http://feh.finalrewind.org/
 FEH_DEPENDENCIES = libcurl imlib2 libpng xlib_libXinerama xlib_libXt
+FEH_LICENSE = MIT
+FEH_LICENSE_FILES = COPYING
 
 define FEH_BUILD_CMDS
 	$(MAKE1) CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS)" \
-- 
1.8.5.5
