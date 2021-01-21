From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 21 Jan 2021 22:04:36 +0100
Subject: [Buildroot] [git commit] package/zsh: add ZSH_CPE_ID_VENDOR
Message-ID: <20210121205056.ECB3280DF5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4af3af95a4cd1b6e6ddf06f2fe8e421b9231baae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:zsh:zsh is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Azsh%3Azsh

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
