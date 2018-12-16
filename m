From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 16 Dec 2018 21:19:05 +0100
Subject: [Buildroot] [PATCH 3/4] wsapi-fcgi: bump to version 1.7
In-Reply-To: <20181216201906.25729-1-francois.perrad@gadz.org>
References: <20181216201906.25729-1-francois.perrad@gadz.org>
Message-ID: <20181216201906.25729-3-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/wsapi-fcgi/wsapi-fcgi.hash | 2 +-
 package/wsapi-fcgi/wsapi-fcgi.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/wsapi-fcgi/wsapi-fcgi.hash b/package/wsapi-fcgi/wsapi-fcgi.hash
index f82ce9cfc..39ae57ec6 100644
--- a/package/wsapi-fcgi/wsapi-fcgi.hash
+++ b/package/wsapi-fcgi/wsapi-fcgi.hash
@@ -1,2 +1,2 @@
 # locally computed hash
-sha256 73dc200889bc185953cd3a7c5350c998c090f901fcd10771273b7a63a3ffcdcf  wsapi-fcgi-1.6.1-1.src.rock
+sha256 14b77861638a5e863fd10d60ad460a961dc108ea5b915f71461a18d5e6be8e4e  wsapi-fcgi-1.7-1.src.rock
diff --git a/package/wsapi-fcgi/wsapi-fcgi.mk b/package/wsapi-fcgi/wsapi-fcgi.mk
index 2b0e6b255..946f137dc 100644
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
-- 
2.17.1
