From: Adam Duskett <aduskett@gmail.com>
Date: Fri,  3 Feb 2017 15:29:52 -0500
Subject: [Buildroot] [PATCH 04/11] jansson: bump to version 2.9
In-Reply-To: <20170203202959.18916-1-aduskett@codeblue.com>
References: <20170203202959.18916-1-aduskett@codeblue.com>
Message-ID: <20170203202959.18916-4-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/jansson/jansson.hash | 2 +-
 package/jansson/jansson.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/jansson/jansson.hash b/package/jansson/jansson.hash
index 013d929..adb345d 100644
--- a/package/jansson/jansson.hash
+++ b/package/jansson/jansson.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	7905e6590fb316c0ff943df3dc6a21cd81a59cff7a6d12514054c359d04d78d7	jansson-2.7.tar.gz
+sha256	0ad0d074ca049a36637e7abef755d40849ad73e926b93914ce294927b97bd2a5	jansson-2.9.tar.gz
diff --git a/package/jansson/jansson.mk b/package/jansson/jansson.mk
index 193fafb..5e13118 100644
--- a/package/jansson/jansson.mk
+++ b/package/jansson/jansson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JANSSON_VERSION = 2.7
+JANSSON_VERSION = 2.9
 JANSSON_SITE = http://www.digip.org/jansson/releases
 JANSSON_LICENSE = MIT
 JANSSON_LICENSE_FILES = LICENSE
-- 
2.9.3
