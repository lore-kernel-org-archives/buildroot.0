From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 14 Nov 2019 22:20:11 +0100
Subject: [Buildroot] [PATCH 1/2] package/neardal: license is LGPL-2.0,
 not GPL-2.0
Message-ID: <20191114212013.29398-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

COPYING states LGPL-2.0, not GPL-2.0:

                  GNU LIBRARY GENERAL PUBLIC LICENSE
                       Version 2, June 1991

So use that for the license tag.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/neardal/neardal.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/neardal/neardal.mk b/package/neardal/neardal.mk
index ea9643244e..b56ce3b3a3 100644
--- a/package/neardal/neardal.mk
+++ b/package/neardal/neardal.mk
@@ -7,7 +7,7 @@
 NEARDAL_VERSION = 4143d130ed39299bfc59d08d2c7c77dbc7f809e9
 NEARDAL_SITE = $(call github,connectivity,neardal,$(NEARDAL_VERSION))
 NEARDAL_INSTALL_STAGING = YES
-NEARDAL_LICENSE = GPL-2.0
+NEARDAL_LICENSE = LGPL-2.0
 NEARDAL_LICENSE_FILES = COPYING
 
 NEARDAL_DEPENDENCIES = host-pkgconf dbus dbus-glib
-- 
2.20.1
