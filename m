From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Jan 2016 23:03:44 +0100
Subject: [Buildroot] [git commit] sqlite: bump to version 3.10.2
Message-ID: <20160120220348.66F4D8014E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=544e2c5871f223facd1ab3c2853cd07ad70dd9d1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sqlite/sqlite.hash | 4 ++--
 package/sqlite/sqlite.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 116bbba..1f07794 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,4 +1,4 @@
 # From http://www.sqlite.org/download.html
-sha1	fedd95d402628ed0e0e3444ce50bcbd1fe2e7294	sqlite-autoconf-3100100.tar.gz
+sha1	ea4156fc3f6a4a4a2752a5a3ac5c5b3fe7e1a24b	sqlite-autoconf-3100200.tar.gz
 # Calculated based on the hash above
-sha256	3cb4e17137f7422554c8e8906b5a7274c7a0d362872e8aa25233c3f1246bda98	sqlite-autoconf-3100100.tar.gz
+sha256	a2b3b4bd1291ea7d6c8252f7edff36a4362f2f0e5d5370444ba6cbe313ae2971	sqlite-autoconf-3100200.tar.gz
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index e47e3c2..bf31292 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3100100
+SQLITE_VERSION = 3100200
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = http://www.sqlite.org/2016
 SQLITE_LICENSE = Public domain
