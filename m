From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Mon,  3 Nov 2014 11:01:16 +0100
Subject: [Buildroot] [PATCH 2/2] package/libupnpp: bump to version 0.8.6
In-Reply-To: <1415008876-4733-1-git-send-email-jkrause@posteo.de>
References: <1415008876-4733-1-git-send-email-jkrause@posteo.de>
Message-ID: <1415008876-4733-2-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 package/libupnpp/libupnpp.hash | 4 ++--
 package/libupnpp/libupnpp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libupnpp/libupnpp.hash b/package/libupnpp/libupnpp.hash
index af39480..19541cf 100644
--- a/package/libupnpp/libupnpp.hash
+++ b/package/libupnpp/libupnpp.hash
@@ -1,2 +1,2 @@
-# Hashes from: http://www.lesbonscomptes.com/upmpdcli/downloads/libupnpp-0.8.5.tar.gz.sha256
-sha256 07741ea219689174d0ea745df566bb617f7e2f250eefd424920291b3d344f693  libupnpp-0.8.5.tar.gz
+# Hashes from: http://www.lesbonscomptes.com/upmpdcli/downloads/libupnpp-0.8.6.tar.gz.sha256
+sha256 cdacf083100552a5aad57b30608e85fbcc222f4acf920c2d09d28cb75af2cdf8  libupnpp-0.8.6.tar.gz
diff --git a/package/libupnpp/libupnpp.mk b/package/libupnpp/libupnpp.mk
index d46de14..ad790f8 100644
--- a/package/libupnpp/libupnpp.mk
+++ b/package/libupnpp/libupnpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUPNPP_VERSION = 0.8.5
+LIBUPNPP_VERSION = 0.8.6
 LIBUPNPP_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
 LIBUPNPP_LICENSE = GPLv2+
 LIBUPNPP_LICENSE_FILES = COPYING
-- 
2.1.3
