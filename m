From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 20 Jan 2021 21:48:52 +0100
Subject: [Buildroot] [PATCH 1/1] package/zsh: add ZSH_CPE_ID_VENDOR
Message-ID: <20210120204852.183216-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:zsh:zsh is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Azsh%3Azsh

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/zsh/zsh.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/zsh/zsh.mk b/package/zsh/zsh.mk
index c3d9e52152..1a04833211 100644
--- a/package/zsh/zsh.mk
+++ b/package/zsh/zsh.mk
@@ -12,6 +12,7 @@ ZSH_CONF_OPTS = --bindir=/bin
 ZSH_CONF_ENV = zsh_cv_sys_nis=no zsh_cv_sys_nis_plus=no
 ZSH_LICENSE = MIT-like
 ZSH_LICENSE_FILES = LICENCE
+ZSH_CPE_ID_VENDOR = zsh
 
 ifeq ($(BR2_PACKAGE_GDBM),y)
 ZSH_CONF_OPTS += --enable-gdbm
-- 
2.29.2
