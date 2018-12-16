From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 16 Dec 2018 21:19:06 +0100
Subject: [Buildroot] [PATCH 4/4] wsapi-xavante: bump to version 1.7
In-Reply-To: <20181216201906.25729-1-francois.perrad@gadz.org>
References: <20181216201906.25729-1-francois.perrad@gadz.org>
Message-ID: <20181216201906.25729-4-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/wsapi-xavante/wsapi-xavante.hash | 2 +-
 package/wsapi-xavante/wsapi-xavante.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/wsapi-xavante/wsapi-xavante.hash b/package/wsapi-xavante/wsapi-xavante.hash
index 9e8132df5..7b8769fed 100644
--- a/package/wsapi-xavante/wsapi-xavante.hash
+++ b/package/wsapi-xavante/wsapi-xavante.hash
@@ -1,2 +1,2 @@
 # locally computed hash
-sha256 b30b171e3d4d6fd7e129f14576e1cfc5adf00c0780ef8350f2f9e6f1d4259346  wsapi-xavante-1.6.1-1.src.rock
+sha256 01211bb80dab92f87cece6e31854d73ae4a2ce06af7c48423a54313d72adf9fb  wsapi-xavante-1.7-1.src.rock
diff --git a/package/wsapi-xavante/wsapi-xavante.mk b/package/wsapi-xavante/wsapi-xavante.mk
index 86f5dee50..cdf160bba 100644
--- a/package/wsapi-xavante/wsapi-xavante.mk
+++ b/package/wsapi-xavante/wsapi-xavante.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-WSAPI_XAVANTE_VERSION_MAJOR = 1.6.1
-WSAPI_XAVANTE_VERSION = $(WSAPI_XAVANTE_VERSION_MAJOR)-1
-WSAPI_XAVANTE_SUBDIR = wsapi-$(WSAPI_XAVANTE_VERSION_MAJOR)
+WSAPI_XAVANTE_VERSION = 1.7-1
+WSAPI_XAVANTE_SUBDIR = wsapi
 WSAPI_XAVANTE_LICENSE = MIT
 WSAPI_XAVANTE_LICENSE_FILES = $(WSAPI_XAVANTE_SUBDIR)/doc/us/license.html
 
-- 
2.17.1
