From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 25 Oct 2020 10:39:48 +0100
Subject: [Buildroot] [PATCH 1/1] package/sshguard: bump to version 2.4.1
Message-ID: <20201025093948.396268-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bitbucket.org/sshguard/sshguard/src/master/CHANGELOG.rst#rst-header-id23

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sshguard/sshguard.hash | 4 ++--
 package/sshguard/sshguard.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sshguard/sshguard.hash b/package/sshguard/sshguard.hash
index beb77a4d62..9bbb41336f 100644
--- a/package/sshguard/sshguard.hash
+++ b/package/sshguard/sshguard.hash
@@ -1,4 +1,4 @@
-# sha256 from https://sourceforge.net/projects/sshguard/files/sshguard/2.4.0/sshguard-2.4.0.sha256
-sha256  065ca4091b3a96802714b560dbbc3d9f0e67574e99e2b6e8857aa1027d17d6c0  sshguard-2.4.0.tar.gz
+# sha256 from https://sourceforge.net/projects/sshguard/files/sshguard/2.4.1/sshguard-2.4.1.sha256
+sha256  875d02e6e67dced614790ed5e36aef1160edea940f353a79306cbb1852af3c67  sshguard-2.4.1.tar.gz
 # Locally calculated
 sha256  c3ae64f12153a1bc55bc234d09f40a08ab0e0149fffc972c0b7f02d5a12c1a5c  COPYING
diff --git a/package/sshguard/sshguard.mk b/package/sshguard/sshguard.mk
index ceff520693..3616fba780 100644
--- a/package/sshguard/sshguard.mk
+++ b/package/sshguard/sshguard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SSHGUARD_VERSION = 2.4.0
+SSHGUARD_VERSION = 2.4.1
 SSHGUARD_SITE = https://sourceforge.net/projects/sshguard/files/sshguard/$(SSHGUARD_VERSION)
 SSHGUARD_LICENSE = ISC, Public Domain (fnv hash), BSD-3-Clause (SimCList)
 SSHGUARD_LICENSE_FILES = COPYING
-- 
2.28.0
