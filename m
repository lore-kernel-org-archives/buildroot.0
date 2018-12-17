From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Dec 2018 09:56:09 +0100
Subject: [Buildroot] [git commit] package/wsapi-xavante: bump to version 1.7
Message-ID: <20181217085210.703C4803BA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=44462aa16717bfe0c26216551973a8f3fb3bc881
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wsapi-xavante/wsapi-xavante.hash | 2 +-
 package/wsapi-xavante/wsapi-xavante.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/wsapi-xavante/wsapi-xavante.hash b/package/wsapi-xavante/wsapi-xavante.hash
index 9e8132df5c..7b8769feda 100644
--- a/package/wsapi-xavante/wsapi-xavante.hash
+++ b/package/wsapi-xavante/wsapi-xavante.hash
@@ -1,2 +1,2 @@
 # locally computed hash
-sha256 b30b171e3d4d6fd7e129f14576e1cfc5adf00c0780ef8350f2f9e6f1d4259346  wsapi-xavante-1.6.1-1.src.rock
+sha256 01211bb80dab92f87cece6e31854d73ae4a2ce06af7c48423a54313d72adf9fb  wsapi-xavante-1.7-1.src.rock
diff --git a/package/wsapi-xavante/wsapi-xavante.mk b/package/wsapi-xavante/wsapi-xavante.mk
index 86f5dee505..cdf160bba0 100644
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
 
