From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 6 Oct 2013 11:02:17 +0200
Subject: [Buildroot] [git commit] stunnel: bump to version 4.56
Message-ID: <20131006105631.D5C049B88B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f91b0a0c7d76aed1086086daecfd5ff9e5dd674e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/stunnel/stunnel.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index 8548eab..fbe7b94 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STUNNEL_VERSION = 4.55
+STUNNEL_VERSION = 4.56
 STUNNEL_SITE = http://ftp.nluug.nl/pub/networking/stunnel/archive/4.x/
 STUNNEL_DEPENDENCIES = openssl
 STUNNEL_CONF_OPT = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork
