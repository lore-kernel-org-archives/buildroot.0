From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 20 Jul 2017 00:10:22 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] php: add version to
	license string
Message-ID: <20170720055507.ED681821A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dfce4519e847e598ac49860f8401477a7ccbe550
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

As per LICENSE file, php uses PHP license version 3.01.

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit e066bfa66487f5754ab69a750f49866ace3f4c72)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index f59a4e8..22eeddd 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -11,7 +11,7 @@ PHP_INSTALL_STAGING = YES
 PHP_INSTALL_STAGING_OPTS = INSTALL_ROOT=$(STAGING_DIR) install
 PHP_INSTALL_TARGET_OPTS = INSTALL_ROOT=$(TARGET_DIR) install
 PHP_DEPENDENCIES = host-pkgconf
-PHP_LICENSE = PHP
+PHP_LICENSE = PHP-3.01
 PHP_LICENSE_FILES = LICENSE
 PHP_CONF_OPTS = \
 	--mandir=/usr/share/man \
