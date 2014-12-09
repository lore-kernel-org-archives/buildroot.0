From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Dec 2014 20:48:57 +0100
Subject: [Buildroot] [git commit] sqlite: bump to version 3.8.7.4
Message-ID: <20141209194901.EAE808010D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0085a19c8c37b8146fc2e700a3e7a039c3d3ad95
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sqlite/sqlite.hash |    2 +-
 package/sqlite/sqlite.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 31906b9..57269fe 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,2 +1,2 @@
 # From http://www.sqlite.org/download.html
-sha1	5cbe9aa4af1b32787045a251dba6debee3f061c0	sqlite-autoconf-3080703.tar.gz
+sha1	70ca0b8884a6b145b7f777724670566e2b4f3cde	sqlite-autoconf-3080704.tar.gz
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 7513c33..f010ee3 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3080703
+SQLITE_VERSION = 3080704
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org/2014
 SQLITE_LICENSE = Public domain
