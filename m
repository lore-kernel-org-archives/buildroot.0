From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 27 Mar 2019 20:56:45 +0100
Subject: [Buildroot] [PATCH 1/1] package/sqlite: bump to version 3.27.2
Message-ID: <20190327195645.21567-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sqlite/sqlite.hash | 4 ++--
 package/sqlite/sqlite.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 7be42a0aca..5e2bc7030a 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,6 +1,6 @@
 # From https://www.sqlite.org/download.html
-sha1 5d6dc7634ec59e7a6fffa8758c1e184b2522c2e5  sqlite-autoconf-3250300.tar.gz
+sha1 5f5750e3f39b7b60394a2fb6ddb2371f848670e6  sqlite-autoconf-3270200.tar.gz
 # Calculated based on the hash above
-sha256 00ebf97be13928941940cc71de3d67e9f852698233cd98ce2d178fd08092f3dd  sqlite-autoconf-3250300.tar.gz
+sha256 50c39e85ea28b5ecfdb3f9e860afe9ba606381e21836b2849efca6a0bfe6ef6e  sqlite-autoconf-3270200.tar.gz
 # Locally calculated
 sha256 66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 6cf5710e5d..95ededd8c4 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3250300
+SQLITE_VERSION = 3270200
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
-SQLITE_SITE = https://www.sqlite.org/2018
+SQLITE_SITE = https://www.sqlite.org/2019
 SQLITE_LICENSE = Public domain
 SQLITE_LICENSE_FILES = tea/license.terms
 SQLITE_INSTALL_STAGING = YES
-- 
2.20.1
