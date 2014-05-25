From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 25 May 2014 22:25:19 +0200
Subject: [Buildroot] [git commit] attr: add license information
Message-ID: <20140525204125.C4AEB9CD68@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=006f1192695df1defa03c4ed83f2292876c8fe9c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add missing license info and file for package 'attr'

[Peter: change to '+' version of licenses]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/attr/attr.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/attr/attr.mk b/package/attr/attr.mk
index f7179a2..87bdd21 100644
--- a/package/attr/attr.mk
+++ b/package/attr/attr.mk
@@ -9,6 +9,8 @@ ATTR_SOURCE = attr-$(ATTR_VERSION).src.tar.gz
 ATTR_SITE = http://download.savannah.gnu.org/releases/attr
 ATTR_INSTALL_STAGING = YES
 ATTR_CONF_OPT = --enable-gettext=no
+ATTR_LICENSE = GPLv2+ LGPGv2.1+
+ATTR_LICENSE_FILES = doc/COPYING doc/COPYING.LGPL
 
 # While the configuration system uses autoconf, the Makefiles are
 # hand-written and do not use automake. Therefore, we have to hack
