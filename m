From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Jan 2015 00:30:02 +0100
Subject: [Buildroot] [git commit] sqlite: bump to version 3.8.8
Message-ID: <20150119234523.1C7B2804FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=57f98eee5be9bfd0f35273cb97e1fbfe82ef0268
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sqlite/sqlite.hash |    2 +-
 package/sqlite/sqlite.mk   |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 57269fe..def3b30 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,2 +1,2 @@
 # From http://www.sqlite.org/download.html
-sha1	70ca0b8884a6b145b7f777724670566e2b4f3cde	sqlite-autoconf-3080704.tar.gz
+sha1	abb7570b7e331ffede7f40f0037be6e0c03b73af	sqlite-autoconf-3080800.tar.gz
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index a4920eb..c1baae3 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3080704
+SQLITE_VERSION = 3080800
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
-SQLITE_SITE = http://www.sqlite.org/2014
+SQLITE_SITE = http://www.sqlite.org/2015
 SQLITE_LICENSE = Public domain
 SQLITE_INSTALL_STAGING = YES
 
