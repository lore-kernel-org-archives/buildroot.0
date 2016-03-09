From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Mar 2016 07:26:05 +0100
Subject: [Buildroot] [git commit] hiawatha: bump to version 10.1
Message-ID: <20160309062700.EEE828180B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8d1c7975fccc214ea0d6518f4ff55220b8b30b68
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/hiawatha/hiawatha.hash | 2 +-
 package/hiawatha/hiawatha.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hiawatha/hiawatha.hash b/package/hiawatha/hiawatha.hash
index af59e9f..5709076 100644
--- a/package/hiawatha/hiawatha.hash
+++ b/package/hiawatha/hiawatha.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	a39d1f771d818025538bd1231f42001bf29a1ebf55ce3d82afb7305cc251dd0e	hiawatha-10.0.tar.gz
+sha256	3892e0a1836661c8dcc649f9ae965289f701640a618baf2c2287da9b78e36cf1	hiawatha-10.1.tar.gz
diff --git a/package/hiawatha/hiawatha.mk b/package/hiawatha/hiawatha.mk
index 411853b..d30b1a1 100644
--- a/package/hiawatha/hiawatha.mk
+++ b/package/hiawatha/hiawatha.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HIAWATHA_VERSION = 10.0
+HIAWATHA_VERSION = 10.1
 HIAWATHA_SITE = http://www.hiawatha-webserver.org/files
 HIAWATHA_DEPENDENCIES = zlib
 HIAWATHA_LICENSE = GPLv2
