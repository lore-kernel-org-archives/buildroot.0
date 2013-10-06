From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 6 Oct 2013 11:02:05 +0200
Subject: [Buildroot] [git commit] stunnel: fix download url
Message-ID: <20131006105631.CC6179B88B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cb1ea6c185a544e2039d4e86eb64fcea2630307a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/stunnel/stunnel.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/stunnel/stunnel.mk b/package/stunnel/stunnel.mk
index bfe96c3..8548eab 100644
--- a/package/stunnel/stunnel.mk
+++ b/package/stunnel/stunnel.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 STUNNEL_VERSION = 4.55
-STUNNEL_SITE = http://ftp.nluug.nl/pub/networking/stunnel
+STUNNEL_SITE = http://ftp.nluug.nl/pub/networking/stunnel/archive/4.x/
 STUNNEL_DEPENDENCIES = openssl
 STUNNEL_CONF_OPT = --with-ssl=$(STAGING_DIR)/usr --with-threads=fork
 STUNNEL_LICENSE = GPLv2+
