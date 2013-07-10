From: Gilles Talis <gilles.talis@gmail.com>
Date: Wed, 10 Jul 2013 10:25:42 -0700
Subject: [Buildroot] [PATCH 03/11] libelf: define license
In-Reply-To: <1373477150-10251-1-git-send-email-gilles.talis@gmail.com>
References: <1373477150-10251-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <1373477150-10251-3-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/libelf/libelf.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libelf/libelf.mk b/package/libelf/libelf.mk
index 725035f..c1befc8 100644
--- a/package/libelf/libelf.mk
+++ b/package/libelf/libelf.mk
@@ -10,6 +10,8 @@ LIBELF_SITE=http://www.mr511.de/software/
 LIBELF_INSTALL_STAGING = YES
 LIBELF_INSTALL_STAGING_OPT = instroot=$(STAGING_DIR) install
 LIBELF_INSTALL_TARGET_OPT = instroot=$(TARGET_DIR) install
+LIBELF_LICENSE = GPLv2+
+LIBELF_LICENSE_FILES = COPYING.LIB
 
 LIBELF_CONF_ENV = libelf_cv_working_memmove=yes \
 		mr_cv_target_elf=yes \
-- 
1.7.4.1
