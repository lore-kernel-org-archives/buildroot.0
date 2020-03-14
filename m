From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 17:34:19 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/armadillo: fix
 license
Message-ID: <20200314162141.EF92383679@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dd5710639c52fb43ddc88437685a5c40ced72c88
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

License is Apache-2.0 since version 7.800:
http://arma.sourceforge.net/license.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9918596544323bc0bceb1c40363b208962462f36)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/armadillo/armadillo.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index b5fe403a7a..5d9e3eda57 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -9,7 +9,7 @@ ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
 ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
 ARMADILLO_DEPENDENCIES = clapack
 ARMADILLO_INSTALL_STAGING = YES
-ARMADILLO_LICENSE = MPL-2.0
+ARMADILLO_LICENSE = Apache-2.0
 ARMADILLO_LICENSE_FILES = LICENSE.txt
 
 $(eval $(cmake-package))
