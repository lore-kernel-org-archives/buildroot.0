From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Jul 2021 21:48:44 +0200
Subject: [Buildroot] [git commit] package/syslog-ng: bump version to 3.33.1
Message-ID: <20210715191849.DAA5D84649@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=a9e405b07976815a5b7202a5fe50c8797e754178
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/syslog-ng/syslog-ng/releases/tag/syslog-ng-3.33.1
https://github.com/syslog-ng/syslog-ng/compare/syslog-ng-3.32.1...syslog-ng-3.33.1

Signed-off-by: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/syslog-ng/syslog-ng.conf | 2 +-
 package/syslog-ng/syslog-ng.hash | 2 +-
 package/syslog-ng/syslog-ng.mk   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/syslog-ng/syslog-ng.conf b/package/syslog-ng/syslog-ng.conf
index 5f21d5c267..4d1526b812 100644
--- a/package/syslog-ng/syslog-ng.conf
+++ b/package/syslog-ng/syslog-ng.conf
@@ -1,4 +1,4 @@
- at version: 3.32
+ at version: 3.33
 
 source s_sys {
 	file("/proc/kmsg" program_override("kernel"));
diff --git a/package/syslog-ng/syslog-ng.hash b/package/syslog-ng/syslog-ng.hash
index d25eb4f69b..fdf37ec3d9 100644
--- a/package/syslog-ng/syslog-ng.hash
+++ b/package/syslog-ng/syslog-ng.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  19e3b76552d82c71c04230526925402c9f05fa5e6ea19b912b061850929b712d  syslog-ng-3.32.1.tar.gz
+sha256  35913654582947705a5679c9a2dcd4d25b4c98f3f3734cd55e94c5c780c22877  syslog-ng-3.33.1.tar.gz
 sha256  e912cf1e1c09b81d61c0154eb6c179588622c31ad07bfb4a90c612d07ff09d9b  COPYING
 sha256  ce3324c9f22299cfc7c281e5a6ab40fbe9c2ea1a67cee87226cb8cd39db1e1d2  GPL.txt
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LGPL.txt
diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index 2f4e71931c..b5aa5ca027 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please check at runtime if the version in
 # syslog-ng.conf header needs to be updated
-SYSLOG_NG_VERSION = 3.32.1
+SYSLOG_NG_VERSION = 3.33.1
 SYSLOG_NG_SITE = https://github.com/balabit/syslog-ng/releases/download/syslog-ng-$(SYSLOG_NG_VERSION)
 SYSLOG_NG_LICENSE = LGPL-2.1+ (syslog-ng core), GPL-2.0+ (modules)
 SYSLOG_NG_LICENSE_FILES = COPYING GPL.txt LGPL.txt
