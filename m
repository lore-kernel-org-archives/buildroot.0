From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 Nov 2013 00:34:00 +0100
Subject: [Buildroot] [git commit] sqlcipher: fix download url
Message-ID: <20131105233457.B75F59BA95@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f72755c7e11e35188152c6ddb3e1ebd7d74eab4b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sqlcipher/sqlcipher.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/sqlcipher/sqlcipher.mk b/package/sqlcipher/sqlcipher.mk
index 3ade403..e93d24d 100644
--- a/package/sqlcipher/sqlcipher.mk
+++ b/package/sqlcipher/sqlcipher.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SQLCIPHER_VERSION = v1.1.9
-SQLCIPHER_SITE = http://github.com/sjlombardo/sqlcipher/tarball/$(SQLCIPHER_VERSION)
+SQLCIPHER_SITE = http://github.com/sqlcipher/sqlcipher/archive/$(SQLCIPHER_VERSION)
 SQLCIPHER_DEPENDENCIES = openssl host-tcl
 SQLCIPHER_INSTALL_STAGING = YES
 
