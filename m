From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu, 12 Jan 2017 12:04:51 +0100
Subject: [Buildroot] [PATCH] package/ortp: bump version to 0.27.0
Message-ID: <20170112110451.19511-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/ortp/ortp.hash | 2 +-
 package/ortp/ortp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ortp/ortp.hash b/package/ortp/ortp.hash
index 8b099a705..c990d96eb 100644
--- a/package/ortp/ortp.hash
+++ b/package/ortp/ortp.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	0deb826b79b1fd329f7638821d5439dc343bc55bb122daa6c90d19116cfe8d9a	ortp-0.25.0.tar.gz
+sha256  eb61a833ab3ad80978d7007411240f46e9b2d1034373b9d9dfaac88c1b6ec0af  ortp-0.27.0.tar.gz
diff --git a/package/ortp/ortp.mk b/package/ortp/ortp.mk
index ca4a90d6d..864474f39 100644
--- a/package/ortp/ortp.mk
+++ b/package/ortp/ortp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ORTP_VERSION = 0.25.0
+ORTP_VERSION = 0.27.0
 ORTP_SITE = http://download.savannah.nongnu.org/releases/linphone/ortp/sources
 
 ORTP_CONF_OPTS = --disable-strict
-- 
2.11.0
