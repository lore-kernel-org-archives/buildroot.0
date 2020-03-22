From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Mar 2020 08:35:00 +0100
Subject: [Buildroot] [git commit] package/restclient-cpp: bump to version
 0.5.2
Message-ID: <20200322072314.F074183C75@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=67486321cba8e2b632f021a618bc45bab143d554
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
[yann.morin.1998 at free.fr: two spaces in hash file]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/restclient-cpp/restclient-cpp.hash | 4 ++--
 package/restclient-cpp/restclient-cpp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/restclient-cpp/restclient-cpp.hash b/package/restclient-cpp/restclient-cpp.hash
index 428ec51f5f..96c6d6c9e0 100644
--- a/package/restclient-cpp/restclient-cpp.hash
+++ b/package/restclient-cpp/restclient-cpp.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256 6ae98c65333214d13d765d8fde04ec696f88ce349a419df0fbfc4564bc779df3 restclient-cpp-0.5.1.tar.gz
-sha256 1c2f79e825a39eb61d8919044776627f4d079ff38975410a3bde340154fc94a4 LICENSE
+sha256  d62ba618f9a938652fd53b483289e8662a99451839e59058c8beb286dfbc65ec  restclient-cpp-0.5.2.tar.gz
+sha256  1c2f79e825a39eb61d8919044776627f4d079ff38975410a3bde340154fc94a4  LICENSE
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
