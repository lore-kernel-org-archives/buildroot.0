From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 8 Jan 2020 23:10:09 +0100
Subject: [Buildroot] [git commit] package/mtr: bump to version 0.93
Message-ID: <20200108220048.ADA7F870D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=15eaf1cb225b633c83858dc09ba971121dd20cae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mtr/mtr.hash | 3 ++-
 package/mtr/mtr.mk   | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/mtr/mtr.hash b/package/mtr/mtr.hash
index f3df81f42a..7771e091e2 100644
--- a/package/mtr/mtr.hash
+++ b/package/mtr/mtr.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	12a6a94c0ec04d508de27eda5f5ba91f50d4b5fe74a98aca0973e2c16a42555a	mtr-66de3ecbab28b054b868a73fbb57f30549d770ac.tar.gz
+sha256	3a1ab330104ddee3135af3cfa567b9608001c5deecbf200c08b545ed6d7a4c8f	mtr-0.93.tar.gz
+sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
diff --git a/package/mtr/mtr.mk b/package/mtr/mtr.mk
index 82688ed061..7a4b140267 100644
--- a/package/mtr/mtr.mk
+++ b/package/mtr/mtr.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MTR_VERSION = 66de3ecbab28b054b868a73fbb57f30549d770ac
-MTR_SITE = $(call github,traviscross,mtr,$(MTR_VERSION))
+MTR_VERSION = 0.93
+MTR_SITE = $(call github,traviscross,mtr,v$(MTR_VERSION))
 MTR_AUTORECONF = YES
 MTR_CONF_OPTS = --without-gtk
 MTR_DEPENDENCIES = host-pkgconf $(if $(BR2_PACKAGE_NCURSES),ncurses)
