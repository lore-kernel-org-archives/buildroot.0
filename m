From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 12 Mar 2014 22:25:38 +0100
Subject: [Buildroot] [git commit] sqlite: bump to version 3.8.4.1
Message-ID: <20140312212628.4D5569BE75@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a68997424e7c802d0a781caf589c0450cba81da9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sqlite/sqlite.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index b27eb58..7893e6b 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3080100
+SQLITE_VERSION = 3080401
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
-SQLITE_SITE = http://www.sqlite.org/2013
+SQLITE_SITE = http://www.sqlite.org/2014
 SQLITE_LICENSE = Public domain
 SQLITE_INSTALL_STAGING = YES
 
