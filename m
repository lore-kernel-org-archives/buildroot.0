From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Jun 2015 23:41:41 +0200
Subject: [Buildroot] [git commit] package: indentation cleanup
Message-ID: <20150618214145.A97B481E3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c2c993c31dbeb2774d7c1eabeadf787831d38cf6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ejabberd/ejabberd.mk   |    2 +-
 package/libxmlrpc/libxmlrpc.mk |    2 +-
 package/odhcp6c/odhcp6c.mk     |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ejabberd/ejabberd.mk b/package/ejabberd/ejabberd.mk
index 07ce78e..650dc0e 100644
--- a/package/ejabberd/ejabberd.mk
+++ b/package/ejabberd/ejabberd.mk
@@ -40,7 +40,7 @@ endef
 EJABBERD_POST_INSTALL_TARGET_HOOKS += EJABBERD_FIX_EJABBERDCTL
 
 define EJABBERD_USERS
-ejabberd -1 ejabberd -1 * /var/lib/ejabberd /bin/sh - ejabberd daemon
+	ejabberd -1 ejabberd -1 * /var/lib/ejabberd /bin/sh - ejabberd daemon
 endef
 
 define EJABBERD_INSTALL_INIT_SYSV
diff --git a/package/libxmlrpc/libxmlrpc.mk b/package/libxmlrpc/libxmlrpc.mk
index c3788d6..7d11205 100644
--- a/package/libxmlrpc/libxmlrpc.mk
+++ b/package/libxmlrpc/libxmlrpc.mk
@@ -16,7 +16,7 @@ LIBXMLRPC_MAKE = $(MAKE1)
 
 # Using autoconf, not automake, so we cannot use AUTORECONF = YES.
 define LIBXMLRPC_RUN_AUTOCONF
-       cd $(@D); $(HOST_DIR)/usr/bin/autoconf
+	cd $(@D); $(HOST_DIR)/usr/bin/autoconf
 endef
 
 LIBXMLRPC_PRE_CONFIGURE_HOOKS += LIBXMLRPC_RUN_AUTOCONF
diff --git a/package/odhcp6c/odhcp6c.mk b/package/odhcp6c/odhcp6c.mk
index 8102c26..47944f1 100644
--- a/package/odhcp6c/odhcp6c.mk
+++ b/package/odhcp6c/odhcp6c.mk
@@ -10,7 +10,7 @@ ODHCP6C_LICENSE = GPLv2
 ODHCP6C_LICENSE_FILES = COPYING
 
 define ODHCP6C_INSTALL_SCRIPT
-        $(INSTALL) -m 0755 -D $(@D)/odhcp6c-example-script.sh \
+	$(INSTALL) -m 0755 -D $(@D)/odhcp6c-example-script.sh \
 		$(TARGET_DIR)/usr/sbin/odhcp6c-update
 endef
 
