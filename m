From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 4 Feb 2017 13:07:14 +0100
Subject: [Buildroot] [git commit] jansson: bump to version 2.9
Message-ID: <20170204162521.D38A981EEE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b30764ba2dc9a078967efe0dce88781c87445d1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
