From: spdawson at gmail.com <spdawson@gmail.com>
Date: Fri, 30 Nov 2012 10:14:43 +0000
Subject: [Buildroot] [PATCH 8/8] screen: add license information
In-Reply-To: <1354270483-32356-1-git-send-email-spdawson@gmail.com>
References: <1354270483-32356-1-git-send-email-spdawson@gmail.com>
Message-ID: <1354270483-32356-9-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/screen/screen.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/screen/screen.mk b/package/screen/screen.mk
index 8786322..50bb1a6 100644
--- a/package/screen/screen.mk
+++ b/package/screen/screen.mk
@@ -6,6 +6,8 @@
 
 SCREEN_VERSION = 4.0.3
 SCREEN_SITE = $(BR2_GNU_MIRROR)/screen
+SCREEN_LICENSE = GPLv2
+SCREEN_LICENSE_FILES = COPYING
 SCREEN_DEPENDENCIES = ncurses
 SCREEN_CONF_ENV = ac_cv_header_elf_h=no ac_cv_header_dwarf_h=no \
 	CFLAGS="$(TARGET_CFLAGS) -DTERMINFO"
-- 
1.7.10.4
