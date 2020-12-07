From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 7 Dec 2020 21:38:14 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/monkey: drop
 wrong comment
Message-ID: <20201207203451.723828103E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c8b4783f3db05e49f7e893d13cfbbd0a23a98024
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Commit 5fea6e2a2fa816c0c551bca184fb64fc96d76a08 forgot to remove the
generic-package comment

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c4ea32d0061585a41ef724124b82be337442ce2a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
