From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Nov 2015 15:48:40 +0100
Subject: [Buildroot] [git commit] sqlite: bump to version 3.9.2
Message-ID: <20151103145129.D2C2B80480@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=65ff7365b92e7c4df319e0b73752740696057482
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sqlite/sqlite.hash |    4 ++--
 package/sqlite/sqlite.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 4c8caae..435e5de 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,4 +1,4 @@
 # From http://www.sqlite.org/download.html
-sha1	6b7d22c24c9695118a2706c8e026fb3c31780a30	sqlite-autoconf-3090100.tar.gz
+sha1	dae1ae5297fece9671ae0c434a7ecd0cda09c76a	sqlite-autoconf-3090200.tar.gz
 # Calculated based on the hash above
-sha256	d89d0e1d93deafebd0aa067d20d9029d9914ccde244920d9dd09ea51944e1c6c	sqlite-autoconf-3090100.tar.gz
+sha256	064c0abe9c9177534d4c770bca7a5902f9924b629ac886b4c08956be6dfbc36b	sqlite-autoconf-3090200.tar.gz
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 6ae74ea..d08e933 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3090100
+SQLITE_VERSION = 3090200
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org/2015
 SQLITE_LICENSE = Public domain
