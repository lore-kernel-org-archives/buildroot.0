From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 May 2021 14:58:44 +0200
Subject: [Buildroot] [git commit branch/next] package/sqlite: bump to
 version 3350500
Message-ID: <20210524122941.9DB6588389@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=03b50bfe5fc04b032add4574bba30166468c9dc4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes: https://www.sqlite.org/releaselog/3_35_5.html

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sqlite/Config.in   | 2 +-
 package/sqlite/sqlite.hash | 2 +-
 package/sqlite/sqlite.mk   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/sqlite/Config.in b/package/sqlite/Config.in
index 87c0f6c073..0ae9878d7b 100644
--- a/package/sqlite/Config.in
+++ b/package/sqlite/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_SQLITE
 	  self-contained, embeddable, zero-configuration SQL database
 	  engine.
 
-	  http://www.sqlite.org/
+	  https://www.sqlite.org/
 
 if BR2_PACKAGE_SQLITE
 
diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 02b0e7132a..ec66543224 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2a3bca581117b3b88e5361d0ef3803ba6d8da604b1c1a47d902ef785c1b53e89  sqlite-autoconf-3340100.tar.gz
+sha256  f52b72a5c319c3e516ed7a92e123139a6e87af08a2dc43d7757724f6132e6db0  sqlite-autoconf-3350500.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 2c2928f274..8e864ba2e5 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3340100
-SQLITE_CPE_ID_VERSION = 3.34.1
+SQLITE_VERSION = 3350500
+SQLITE_CPE_ID_VERSION = 3.35.5
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2021
 SQLITE_LICENSE = Public domain
