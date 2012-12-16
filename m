From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 16 Dec 2012 23:17:55 +0100
Subject: [Buildroot] [git commit] netatalk: fix STAGING_DIR typo
Message-ID: <20121216221750.8F28D9A2E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bdafee20a64492daa4d6dc4f3aaf4516c53e12ba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/netatalk/netatalk.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
index 23c2a95..46355ce 100644
--- a/package/netatalk/netatalk.mk
+++ b/package/netatalk/netatalk.mk
@@ -8,7 +8,7 @@ NETATALK_SITE = http://downloads.sourceforge.net/project/netatalk/netatalk/$(NET
 NETATALK_SOURCE = netatalk-$(NETATALK_VERSION).tar.bz2
 
 NETATALK_DEPENDENCIES = host-pkgconf openssl berkeleydb libgcrypt libgpg-error
-NETATALK_CONF_ENV += CC="$(TARGET_CC) -std=gnu99" BDB_LIB=$(STAGING_LIB)/usr/lib
+NETATALK_CONF_ENV += CC="$(TARGET_CC) -std=gnu99" BDB_LIB=$(STAGING_DIR)/usr/lib
 NETATALK_CONF_OPT += --with-cnid-cdb-backend \
 	--with-bdb=$(STAGING_DIR)/usr \
 	--disable-zeroconf \
