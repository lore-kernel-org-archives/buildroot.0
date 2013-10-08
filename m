From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 08 Oct 2013 12:09:00 +0200
Subject: [Buildroot] [PATCH] opkg: add license info
Message-ID: <7a46d76755b46e4a4c18.1381226940@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/opkg/opkg.mk |  2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/opkg/opkg.mk b/package/opkg/opkg.mk
--- a/package/opkg/opkg.mk
+++ b/package/opkg/opkg.mk
@@ -13,6 +13,8 @@ OPKG_CONF_OPT = --disable-curl
 OPKG_AUTORECONF = YES
 # Uses PKG_CHECK_MODULES() in configure.ac
 OPKG_DEPENDENCIES = host-pkgconf
+OPKG_LICENSE = GPLv2+
+OPKG_LICENSE_FILES = COPYING
 
 # Ensure directory for lockfile exists
 define OPKG_CREATE_LOCKDIR
