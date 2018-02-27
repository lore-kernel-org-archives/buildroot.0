From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 26 Feb 2018 20:10:29 -0600
Subject: [Buildroot] [NEXT 14/26] gnupg: add CPE id
In-Reply-To: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <1519697441-54194-15-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/gnupg/gnupg.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gnupg/gnupg.mk b/package/gnupg/gnupg.mk
index 3ff202b..1f73214 100644
--- a/package/gnupg/gnupg.mk
+++ b/package/gnupg/gnupg.mk
@@ -9,6 +9,7 @@ GNUPG_SOURCE = gnupg-$(GNUPG_VERSION).tar.bz2
 GNUPG_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG_LICENSE = GPL-3.0+
 GNUPG_LICENSE_FILES = COPYING
+GNUPG_CPE_ID = $(GNUPG_NAME):$(GNUPG_NAME):$(GNUPG_VERSION)
 GNUPG_DEPENDENCIES = zlib ncurses $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 GNUPG_CONF_ENV = ac_cv_sys_symbol_underscore=no
 GNUPG_CONF_OPTS = \
-- 
1.9.1
