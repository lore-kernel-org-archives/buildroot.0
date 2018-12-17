From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Dec 2018 09:56:08 +0100
Subject: [Buildroot] [git commit] package/wsapi-fcgi: bump to version 1.7
Message-ID: <20181217085210.690ED81587@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9c51827822a5f0352df7fae9e762e1121a184dd9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wsapi-fcgi/wsapi-fcgi.hash | 2 +-
 package/wsapi-fcgi/wsapi-fcgi.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/wsapi-fcgi/wsapi-fcgi.hash b/package/wsapi-fcgi/wsapi-fcgi.hash
index f82ce9cfcf..39ae57ec63 100644
--- a/package/wsapi-fcgi/wsapi-fcgi.hash
+++ b/package/wsapi-fcgi/wsapi-fcgi.hash
@@ -1,2 +1,2 @@
 # locally computed hash
-sha256 73dc200889bc185953cd3a7c5350c998c090f901fcd10771273b7a63a3ffcdcf  wsapi-fcgi-1.6.1-1.src.rock
+sha256 14b77861638a5e863fd10d60ad460a961dc108ea5b915f71461a18d5e6be8e4e  wsapi-fcgi-1.7-1.src.rock
diff --git a/package/wsapi-fcgi/wsapi-fcgi.mk b/package/wsapi-fcgi/wsapi-fcgi.mk
index 2b0e6b255a..946f137dcb 100644
--- a/package/wsapi-fcgi/wsapi-fcgi.mk
+++ b/package/wsapi-fcgi/wsapi-fcgi.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-WSAPI_FCGI_VERSION_MAJOR = 1.6.1
-WSAPI_FCGI_VERSION = $(WSAPI_FCGI_VERSION_MAJOR)-1
-WSAPI_FCGI_SUBDIR = wsapi-$(WSAPI_FCGI_VERSION_MAJOR)
+WSAPI_FCGI_VERSION = 1.7-1
+WSAPI_FCGI_SUBDIR = wsapi
 WSAPI_FCGI_DEPENDENCIES = libfcgi
 WSAPI_FCGI_LICENSE = MIT
 WSAPI_FCGI_LICENSE_FILES = $(WSAPI_FCGI_SUBDIR)/doc/us/license.html
