From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Nov 2019 09:04:21 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/neardal: license
 is LGPL-2.0, not GPL-2.0
Message-ID: <20191119075720.BC1B18F337@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=13a776d696f1a4915b2ad4324e559f97421fda70
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

COPYING states LGPL-2.0, not GPL-2.0:

                  GNU LIBRARY GENERAL PUBLIC LICENSE
                       Version 2, June 1991

So use that for the license tag.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 7387a50c305b80652be664e8c259133d649982d5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/neardal/neardal.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/neardal/neardal.mk b/package/neardal/neardal.mk
index 3883011932..423e24a590 100644
--- a/package/neardal/neardal.mk
+++ b/package/neardal/neardal.mk
@@ -7,7 +7,7 @@
 NEARDAL_VERSION = 33b54a55032b047fd885a5eb3592c169c0056c49
 NEARDAL_SITE = $(call github,connectivity,neardal,$(NEARDAL_VERSION))
 NEARDAL_INSTALL_STAGING = YES
-NEARDAL_LICENSE = GPL-2.0
+NEARDAL_LICENSE = LGPL-2.0
 NEARDAL_LICENSE_FILES = COPYING
 
 NEARDAL_DEPENDENCIES = host-pkgconf dbus dbus-glib
