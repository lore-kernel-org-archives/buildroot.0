From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 20 Nov 2020 18:00:45 +0100
Subject: [Buildroot] [PATCH 1/1] package/monkey: drop wrong comment
Message-ID: <20201120170045.422231-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 5fea6e2a2fa816c0c551bca184fb64fc96d76a08 forgot to remove the
generic-package comment

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/monkey/monkey.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/monkey/monkey.mk b/package/monkey/monkey.mk
index 6159f5522e..5264713120 100644
--- a/package/monkey/monkey.mk
+++ b/package/monkey/monkey.mk
@@ -10,10 +10,6 @@ MONKEY_SITE = http://monkey-project.com/releases/$(MONKEY_VERSION_MAJOR)
 MONKEY_LICENSE = Apache-2.0
 MONKEY_LICENSE_FILES = LICENSE
 
-# This package has a configure script, but it's not using
-# autoconf/automake, so we're using the generic-package
-# infrastructure.
-
 MONKEY_CONF_OPTS = \
 	-DINSTALL_SYSCONFDIR=/etc/monkey \
 	-DINSTALL_WEBROOTDIR=/var/www \
-- 
2.29.2
