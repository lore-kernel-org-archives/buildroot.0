From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 05 Mar 2018 20:07:13 -0000
Subject: [Buildroot] [git commit] package/sqlite: bump version to 3220000
 (3.22.0)
Message-ID: <20180305200710.815B581ED9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f83d92b60f25df3178ce7775716403c76d63d9b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Scott Fan <fancp2007@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sqlite/sqlite.hash | 4 ++--
 package/sqlite/sqlite.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index be5820e1f8..2aac7dc1d3 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,6 +1,6 @@
 # From http://www.sqlite.org/download.html
-sha1 f56fe3407d8297fc0a68a058f4c9e6b77e83575c  sqlite-autoconf-3210000.tar.gz
+sha1 2fb24ec12001926d5209d2da90d252b9825366ac  sqlite-autoconf-3220000.tar.gz
 # Calculated based on the hash above
-sha256 d7dd516775005ad87a57f428b6f86afd206cb341722927f104d3f0cf65fbbbe3  sqlite-autoconf-3210000.tar.gz
+sha256 2824ab1238b706bc66127320afbdffb096361130e23291f26928a027b885c612  sqlite-autoconf-3220000.tar.gz
 # Locally calculated
 sha256 66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 5239592f18..e8ce92df56 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3210000
+SQLITE_VERSION = 3220000
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
-SQLITE_SITE = http://www.sqlite.org/2017
+SQLITE_SITE = http://www.sqlite.org/2018
 SQLITE_LICENSE = Public domain
 SQLITE_LICENSE_FILES = tea/license.terms
 SQLITE_INSTALL_STAGING = YES
