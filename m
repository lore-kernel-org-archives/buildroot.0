From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Tue, 23 Mar 2021 09:30:06 +0100
Subject: [Buildroot] [PATCH 1/1] package/libupnpp: bump to version 0.21.0
Message-ID: <20210323083006.90238-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From https://www.lesbonscomptes.com/upmpdcli/pages/releases.html:

2021-03-13 libupnpp 0.21.0
 * Allow configuring the subscription timeout (init option)
 * Add interface for the lib to report a subscription autorenewal failure, and
   to renew all subscriptions.
 * Add API to set the product/version values in User-Agent and Server headers.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/libupnpp/libupnpp.hash | 4 ++--
 package/libupnpp/libupnpp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libupnpp/libupnpp.hash b/package/libupnpp/libupnpp.hash
index ae79cfe8a7..5bc282f270 100644
--- a/package/libupnpp/libupnpp.hash
+++ b/package/libupnpp/libupnpp.hash
@@ -1,5 +1,5 @@
-# Hash from: http://www.lesbonscomptes.com/upmpdcli/downloads/libupnpp-0.20.2.tar.gz.sha256
-sha256  48c2cc7b5a3eef55f4dddda88d8676ed11f7e88f1d6680c8458512067a0e0a11  libupnpp-0.20.2.tar.gz
+# Hash from: http://www.lesbonscomptes.com/upmpdcli/downloads/libupnpp-0.21.0.tar.gz.sha256
+sha256  e43dbe5020ed25152aaec71b325dd80498e72038da5aeb50ed7dd51e213cd903  libupnpp-0.21.0.tar.gz
 
 # Hash for license file:
 sha256  00a89b0d18aacd4114decf79122db87bf35bddaf2bc50e383c9c9f4c263390b2  COPYING
diff --git a/package/libupnpp/libupnpp.mk b/package/libupnpp/libupnpp.mk
index 4ee98b01cc..fc76a43a11 100644
--- a/package/libupnpp/libupnpp.mk
+++ b/package/libupnpp/libupnpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUPNPP_VERSION = 0.20.2
+LIBUPNPP_VERSION = 0.21.0
 LIBUPNPP_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
 LIBUPNPP_LICENSE = LGPL-2.1+
 LIBUPNPP_LICENSE_FILES = COPYING
-- 
2.31.0
