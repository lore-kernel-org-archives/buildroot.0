From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Nov 2014 23:22:09 +0100
Subject: [Buildroot] [git commit] sqlcipher: bump version
Message-ID: <20141101222733.B08A2B2BF7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a2ec512aa4d4bbf0c0507e92e2e909e711416576
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sqlcipher/sqlcipher.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/sqlcipher/sqlcipher.mk b/package/sqlcipher/sqlcipher.mk
index a118718..86eebb5 100644
--- a/package/sqlcipher/sqlcipher.mk
+++ b/package/sqlcipher/sqlcipher.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLCIPHER_VERSION = v1.1.9
+SQLCIPHER_VERSION = v3.2.0
 SQLCIPHER_SITE = $(call github,sqlcipher,sqlcipher,$(SQLCIPHER_VERSION))
 SQLCIPHER_DEPENDENCIES = openssl host-tcl
 SQLCIPHER_INSTALL_STAGING = YES
