From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 26 Mar 2016 23:21:08 +0100
Subject: [Buildroot] [PATCH 03/18] package/ortp: bump version to 0.25.0
In-Reply-To: <1459030883-15232-1-git-send-email-bernd.kuhls@t-online.de>
References: <1459030883-15232-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1459030883-15232-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This version bump is needed by mediastreamer 2.12.1, the mediastreamer
bump is needed to provide support for ffmpeg 3.0.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ortp/ortp.hash | 4 ++--
 package/ortp/ortp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ortp/ortp.hash b/package/ortp/ortp.hash
index 728a0d1..8b099a7 100644
--- a/package/ortp/ortp.hash
+++ b/package/ortp/ortp.hash
@@ -1,2 +1,2 @@
-# Locally calculated after checking pgp signature
-sha256	6e37e29b3c3559bac1f2ae0c977f6ceb4d4ce8dc713b691dea8bae57bda92d0b	ortp-0.22.0.tar.gz
+# Locally calculated
+sha256	0deb826b79b1fd329f7638821d5439dc343bc55bb122daa6c90d19116cfe8d9a	ortp-0.25.0.tar.gz
diff --git a/package/ortp/ortp.mk b/package/ortp/ortp.mk
index 89bfc06..158b212 100644
--- a/package/ortp/ortp.mk
+++ b/package/ortp/ortp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ORTP_VERSION = 0.22.0
+ORTP_VERSION = 0.25.0
 ORTP_SITE = http://download.savannah.nongnu.org/releases/linphone/ortp/sources
 
 # ortp is not happy with the libsrtp implementation packaged in
-- 
2.8.0.rc3
