From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 18 Sep 2018 23:34:04 +0200
Subject: [Buildroot] [PATCH 2/2] cppcms: bump to version 1.2.1
In-Reply-To: <20180918213404.27239-1-fontaine.fabrice@gmail.com>
References: <20180918213404.27239-1-fontaine.fabrice@gmail.com>
Message-ID: <20180918213404.27239-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cppcms is now licensed under MIT so update license and add hash for
MIT.TXT

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cppcms/cppcms.hash | 13 +++++++------
 package/cppcms/cppcms.mk   |  6 +++---
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/package/cppcms/cppcms.hash b/package/cppcms/cppcms.hash
index 6bfc680ac0..1d3c9179e7 100644
--- a/package/cppcms/cppcms.hash
+++ b/package/cppcms/cppcms.hash
@@ -1,7 +1,8 @@
-# From http://sourceforge.net/projects/cppcms/files/cppcms/1.0.5/
-sha1	15f21897c14acfd4b0c74622e49d95857f2fe939	cppcms-1.0.5.tar.bz2
-md5	d668c201dd31fff8090380ebdc0bcc2b	cppcms-1.0.5.tar.bz2
+# From http://sourceforge.net/projects/cppcms/files/cppcms/1.2.1/
+sha1	9cb25cc5d507d2f4235326ba3815eba252b4ac77	cppcms-1.2.1.tar.bz2
+md5	2bb259fefb86532e404207c71c094a0c	cppcms-1.2.1.tar.bz2
 # Locally computed:
-sha256	84b685977bca97c3e997497f227bd5906adb80555066d811a7046b01c2f51865	cppcms-1.0.5.tar.bz2
-sha256	2ff22bab712c46dbadf9bae0f759bbc95d5d87614cacb7ebc3d5a50910603d6a	COPYING.TXT
-sha256	70fbf0194bee0f444c57ecd47e7d976a3e5a890e4421a21aab49f2d214267e69	THIRD_PARTY_SOFTWARE.TXT
+sha256  10fec7710409c949a229b9019ea065e25ff5687103037551b6f05716bf6cac52        cppcms-1.2.1.tar.bz2
+sha256  fb7c15ddf590037d4cd18ebd61148a2304b9243369d238a64f599182377e32db        COPYING.TXT
+sha256	3e4012cc5950e05bedfdd2f00ceffe1ef71c46ac8c79f07e237ecb23c773f65f	MIT.TXT
+sha256	d6ce062e5cf4f7e3c536d7d2fee84c882c45245f1848ed3162401f2b29fa2b4b	THIRD_PARTY_SOFTWARE.TXT
diff --git a/package/cppcms/cppcms.mk b/package/cppcms/cppcms.mk
index 5fb6375d80..b289617bbc 100644
--- a/package/cppcms/cppcms.mk
+++ b/package/cppcms/cppcms.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-CPPCMS_VERSION = 1.0.5
+CPPCMS_VERSION = 1.2.1
 CPPCMS_SOURCE = cppcms-$(CPPCMS_VERSION).tar.bz2
-CPPCMS_LICENSE = LGPL-3.0, BSL-1.0 (boost), MIT (base64.cpp), Public Domain (json2.js), Zlib (md5)
-CPPCMS_LICENSE_FILES = COPYING.TXT THIRD_PARTY_SOFTWARE.TXT
+CPPCMS_LICENSE = MIT, BSL-1.0 (boost), Public Domain (json2.js), Zlib (md5)
+CPPCMS_LICENSE_FILES = COPYING.TXT MIT.TXT THIRD_PARTY_SOFTWARE.TXT
 CPPCMS_SITE = http://downloads.sourceforge.net/project/cppcms/cppcms/$(CPPCMS_VERSION)
 CPPCMS_INSTALL_STAGING = YES
 CPPCMS_CXXFLAGS = $(TARGET_CXXFLAGS)
-- 
2.17.1
