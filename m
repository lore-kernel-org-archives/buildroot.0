From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 10 Jul 2013 22:07:11 +0200
Subject: [Buildroot] [git commit] libelf: define license
Message-ID: <20130710202005.B65FA9A196@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=94ca0b3d4223320998c692d307d9f26bd22b6f3c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: license is LGPLv2+]
Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libelf/libelf.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libelf/libelf.mk b/package/libelf/libelf.mk
index 725035f..5f788b2 100644
--- a/package/libelf/libelf.mk
+++ b/package/libelf/libelf.mk
@@ -10,6 +10,8 @@ LIBELF_SITE=http://www.mr511.de/software/
 LIBELF_INSTALL_STAGING = YES
 LIBELF_INSTALL_STAGING_OPT = instroot=$(STAGING_DIR) install
 LIBELF_INSTALL_TARGET_OPT = instroot=$(TARGET_DIR) install
+LIBELF_LICENSE = LGPLv2+
+LIBELF_LICENSE_FILES = COPYING.LIB
 
 LIBELF_CONF_ENV = libelf_cv_working_memmove=yes \
 		mr_cv_target_elf=yes \
