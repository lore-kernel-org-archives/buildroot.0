From: Gilles Talis <gilles.talis@gmail.com>
Date: Sun, 22 Mar 2020 07:17:09 +0100
Subject: [Buildroot] [PATCH] package/restclient-cpp: bump to version 0.5.2
Message-ID: <20200322061710.14420-1-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/restclient-cpp/restclient-cpp.hash | 2 +-
 package/restclient-cpp/restclient-cpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/restclient-cpp/restclient-cpp.hash b/package/restclient-cpp/restclient-cpp.hash
index 428ec51f5f..cb79c89c89 100644
--- a/package/restclient-cpp/restclient-cpp.hash
+++ b/package/restclient-cpp/restclient-cpp.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256 6ae98c65333214d13d765d8fde04ec696f88ce349a419df0fbfc4564bc779df3 restclient-cpp-0.5.1.tar.gz
+sha256 d62ba618f9a938652fd53b483289e8662a99451839e59058c8beb286dfbc65ec restclient-cpp-0.5.2.tar.gz
 sha256 1c2f79e825a39eb61d8919044776627f4d079ff38975410a3bde340154fc94a4 LICENSE
diff --git a/package/restclient-cpp/restclient-cpp.mk b/package/restclient-cpp/restclient-cpp.mk
index 9393333095..826be870b9 100644
--- a/package/restclient-cpp/restclient-cpp.mk
+++ b/package/restclient-cpp/restclient-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RESTCLIENT_CPP_VERSION = 0.5.1
+RESTCLIENT_CPP_VERSION = 0.5.2
 RESTCLIENT_CPP_SITE =  $(call github,mrtazz,restclient-cpp,$(RESTCLIENT_CPP_VERSION))
 RESTCLIENT_CPP_LICENSE = MIT
 RESTCLIENT_CPP_LICENSE_FILES = LICENSE
-- 
2.17.1
