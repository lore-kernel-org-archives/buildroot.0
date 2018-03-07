From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  7 Mar 2018 20:31:08 +0100
Subject: [Buildroot] [PATCH 1/1] libupnpp: fix license
Message-ID: <20180307193108.5954-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add license hash and fix LICENSE: since November 2016 (release 0.15.2),
libupnpp is licensed under LGPL-2.1+ and not GPL-2.0+

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libupnpp/libupnpp.hash | 3 +++
 package/libupnpp/libupnpp.mk   | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/libupnpp/libupnpp.hash b/package/libupnpp/libupnpp.hash
index f19e0b5441..fe67987c4e 100644
--- a/package/libupnpp/libupnpp.hash
+++ b/package/libupnpp/libupnpp.hash
@@ -1,2 +1,5 @@
 # Hashes from: http://www.lesbonscomptes.com/upmpdcli/downloads/libupnpp-0.16.0.tar.gz.sha256
 sha256  b34b179e69c46993cf360da9e85db646b03c15ab2927b19eb70e27bf3c359017  libupnpp-0.16.0.tar.gz
+
+# Hash for license file:
+sha256  00a89b0d18aacd4114decf79122db87bf35bddaf2bc50e383c9c9f4c263390b2  COPYING
diff --git a/package/libupnpp/libupnpp.mk b/package/libupnpp/libupnpp.mk
index 4755b706d6..98cb515fe2 100644
--- a/package/libupnpp/libupnpp.mk
+++ b/package/libupnpp/libupnpp.mk
@@ -6,7 +6,7 @@
 
 LIBUPNPP_VERSION = 0.16.0
 LIBUPNPP_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
-LIBUPNPP_LICENSE = GPL-2.0+
+LIBUPNPP_LICENSE = LGPL-2.1+
 LIBUPNPP_LICENSE_FILES = COPYING
 LIBUPNPP_INSTALL_STAGING = YES
 LIBUPNPP_DEPENDENCIES = expat libcurl libupnp
-- 
2.14.1
