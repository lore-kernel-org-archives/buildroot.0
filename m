From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Jul 2012 19:11:27 +0200
Subject: [Buildroot] [git commit branch/next] libelf: fix typo
Message-ID: <20120802195301.C315A8E8F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1b28718006cadcd840fa7ab29027c541f2ded1eb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libelf/libelf.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libelf/libelf.mk b/package/libelf/libelf.mk
index daee7fd..b77b7b2 100644
--- a/package/libelf/libelf.mk
+++ b/package/libelf/libelf.mk
@@ -10,7 +10,7 @@ LIBELF_INSTALL_STAGING = YES
 LIBELF_INSTALL_STAGING_OPT = instroot=$(STAGING_DIR) install
 LIBELF_INSTALL_TARGET_OPT = instroot=$(TARGET_DIR) install
 
-LIBELD_CONF_ENV = libelf_cv_working_memmove=yes \
+LIBELF_CONF_ENV = libelf_cv_working_memmove=yes \
 		mr_cv_target_elf=yes \
 		libelf_64bit=yes
 
