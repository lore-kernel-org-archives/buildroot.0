From: Chris Packham <judge.packham@gmail.com>
Date: Tue, 17 Mar 2020 12:53:25 +1300
Subject: [Buildroot] [PATCH] package/syslog-ng: Bump version to 2.26.1
Message-ID: <20200316235325.26563-1-judge.packham@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Chris Packham <judge.packham@gmail.com>
---
I've build tested this with/without Thomas DS's patch and it builds clean
either way.

 package/syslog-ng/syslog-ng.conf | 2 +-
 package/syslog-ng/syslog-ng.hash | 2 +-
 package/syslog-ng/syslog-ng.mk   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/syslog-ng/syslog-ng.conf b/package/syslog-ng/syslog-ng.conf
index a04a4770b1..e23d80580d 100644
--- a/package/syslog-ng/syslog-ng.conf
+++ b/package/syslog-ng/syslog-ng.conf
@@ -1,4 +1,4 @@
- at version: 3.25
+ at version: 3.26
 
 source s_sys {
 	file("/proc/kmsg" program_override("kernel"));
diff --git a/package/syslog-ng/syslog-ng.hash b/package/syslog-ng/syslog-ng.hash
index 962c354b4c..a752db0016 100644
--- a/package/syslog-ng/syslog-ng.hash
+++ b/package/syslog-ng/syslog-ng.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256 34cb9673bcde58d543890e6c1189f466f938e199f227c524a6fa2f47f4db6817  syslog-ng-3.25.1.tar.gz
+sha256 90214223864df252cea80dbb35c88a2464edcbbb2c9fbc6f6f6c13ee60cb62cd  syslog-ng-3.26.1.tar.gz
 sha256 835219c8ca76156e6337236d1bcb8e617c0b1c2783b4a8bc478e18a86743d607  COPYING
 sha256 ce3324c9f22299cfc7c281e5a6ab40fbe9c2ea1a67cee87226cb8cd39db1e1d2  GPL.txt
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LGPL.txt
diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index 156bd95593..203f2c96b6 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please check at runtime if the version in
 # syslog-ng.conf header needs to be updated
-SYSLOG_NG_VERSION = 3.25.1
+SYSLOG_NG_VERSION = 3.26.1
 SYSLOG_NG_SITE = https://github.com/balabit/syslog-ng/releases/download/syslog-ng-$(SYSLOG_NG_VERSION)
 SYSLOG_NG_LICENSE = LGPL-2.1+ (syslog-ng core), GPL-2.0+ (modules)
 SYSLOG_NG_LICENSE_FILES = COPYING GPL.txt LGPL.txt
-- 
2.25.1
