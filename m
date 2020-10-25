From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Oct 2020 11:03:47 +0100
Subject: [Buildroot] [git commit] package/sshguard: bump to version 2.4.1
Message-ID: <20201025095138.6C81983659@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a7f1e2540cd1cbc61297159ab15ed0e235e20f1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://bitbucket.org/sshguard/sshguard/src/master/CHANGELOG.rst#rst-header-id23

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
