From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Jan 2019 10:43:58 +0100
Subject: [Buildroot] [git commit] sqlcipher: add license
Message-ID: <20190123095125.DD6558E31E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a702f6fcf98891517c9aaf978efc027f5885901f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sqlcipher/sqlcipher.hash | 1 +
 package/sqlcipher/sqlcipher.mk   | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/sqlcipher/sqlcipher.hash b/package/sqlcipher/sqlcipher.hash
index f3c7e0bd9c..8632cd7a50 100644
--- a/package/sqlcipher/sqlcipher.hash
+++ b/package/sqlcipher/sqlcipher.hash
@@ -1,2 +1,3 @@
 # locally computed
 sha256  25fa4f4cb38dcf9e52e4d1f46be8fee9c7aaef35b6df96912a216b289e22c2af  sqlcipher-v3.2.0.tar.gz
+sha256  3eee3c7964a9becc94d747bd36703d31fc86eb994680b06a61bfd4f2661eaac8  LICENSE
diff --git a/package/sqlcipher/sqlcipher.mk b/package/sqlcipher/sqlcipher.mk
index db94d06c54..812ae7fa47 100644
--- a/package/sqlcipher/sqlcipher.mk
+++ b/package/sqlcipher/sqlcipher.mk
@@ -6,6 +6,8 @@
 
 SQLCIPHER_VERSION = v3.2.0
 SQLCIPHER_SITE = $(call github,sqlcipher,sqlcipher,$(SQLCIPHER_VERSION))
+SQLCIPHER_LICENSE = BSD-3-Clause
+SQLCIPHER_LICENSE_FILES = LICENSE
 SQLCIPHER_DEPENDENCIES = openssl host-tcl
 SQLCIPHER_INSTALL_STAGING = YES
 
