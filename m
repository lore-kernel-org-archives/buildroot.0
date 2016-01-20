From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Jan 2016 17:27:25 +0100
Subject: [Buildroot] [git commit] libcroco: fix typo in license file
Message-ID: <20160120162809.BDEAC8280C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fef4fc0e0ebb5235b4aa9301ee7e34a85e8fb4a3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise it won't be saved.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcroco/libcroco.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libcroco/libcroco.mk b/package/libcroco/libcroco.mk
index 0cda9da..c4cb676 100644
--- a/package/libcroco/libcroco.mk
+++ b/package/libcroco/libcroco.mk
@@ -14,7 +14,7 @@ LIBCROCO_CONFIG_SCRIPTS = croco-$(LIBCROCO_VERSION_MAJOR)-config
 # NEWS states that it's only LGPL
 # Source code says v2.1+ even though COPYING.LIB is v2
 LIBCROCO_LICENSE = LGPLv2.1+
-LIBCROSO_LICENSE_FILES = COPYING.LIB
+LIBCROCO_LICENSE_FILES = COPYING.LIB
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
