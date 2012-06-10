From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 10 Jun 2012 21:53:46 +0200
Subject: [Buildroot] [git commit] sqlite: bump to version 3.7.12.1
Message-ID: <20120610201113.8321E96E60@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=90448022248356ba3d3380d68a890db722ced85e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sqlite/sqlite.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 165b991..2c23582 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-SQLITE_VERSION = 3071200
+SQLITE_VERSION = 3071201
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org
 SQLITE_INSTALL_STAGING = YES
