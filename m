From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Dec 2013 09:41:17 +0100
Subject: [Buildroot] [git commit] cryptsetup: bump to version 1.6.3
Message-ID: <20131227084417.7090D9C207@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cbf86418af2fa63e55004b7be896c9bffdf7c96a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cryptsetup/cryptsetup.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index a65f841..6ea3aae 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CRYPTSETUP_VERSION = 1.6.2
+CRYPTSETUP_VERSION = 1.6.3
 CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.bz2
 CRYPTSETUP_SITE = http://cryptsetup.googlecode.com/files
 CRYPTSETUP_CONF_ENV += LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
