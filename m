From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 3 Mar 2016 22:02:38 +0100
Subject: [Buildroot] [git commit] sqlite: bump to version 3.11.1
Message-ID: <20160303210305.E313E818EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cd58dfcf2c599d0c16d46c4863a6547601d471ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sqlite/sqlite.hash | 4 ++--
 package/sqlite/sqlite.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 7a218dc..48e7fbd 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,4 +1,4 @@
 # From http://www.sqlite.org/download.html
-sha1	e2d300e4b24af5ecd67a1396488893fa44864e36	sqlite-autoconf-3110000.tar.gz
+sha1	c4b4dcd735a4daf5a2e2bb90f374484c8d4dad29	sqlite-autoconf-3110100.tar.gz
 # Calculated based on the hash above
-sha256	508d4dcbcf7a7181e95c717a1dc4ae3c0880b3d593be0c4b40abb6c3a0e201fb	sqlite-autoconf-3110000.tar.gz
+sha256	533ff1d0271c2e666f01591271cef01a31648563affa0c95e80ef735077d4377	sqlite-autoconf-3110100.tar.gz
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 870b891..0029fd6 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3110000
+SQLITE_VERSION = 3110100
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org/2016
 SQLITE_LICENSE = Public domain
