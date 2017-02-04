From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 4 Feb 2017 13:04:22 +0100
Subject: [Buildroot] [git commit] audit: bump to version 2.7.1
Message-ID: <20170204162521.B7A398164D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7858e7fd5cb8966198caaf25556961bac018099b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/audit/audit.hash | 2 +-
 package/audit/audit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/audit/audit.hash b/package/audit/audit.hash
index 6b0f0c3..2ae8f99 100644
--- a/package/audit/audit.hash
+++ b/package/audit/audit.hash
@@ -1,2 +1,2 @@
 #Locally computed
-sha256 05533f5d88d9520ceebfd8bfb3fd998ca4a2b246757fec7bbd8e33c287544537 audit-2.7.tar.gz
+sha256 0441790794fd9375dbca598fa0ffb46c57ff37b3a24b94ffec0bbee3215cca09 audit-2.7.1.tar.gz
diff --git a/package/audit/audit.mk b/package/audit/audit.mk
index a576662..298ef20 100644
--- a/package/audit/audit.mk
+++ b/package/audit/audit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUDIT_VERSION = 2.7
+AUDIT_VERSION = 2.7.1
 AUDIT_SITE = http://people.redhat.com/sgrubb/audit
 AUDIT_LICENSE = GPLv2+ (programs), unclear (libraries)
 AUDIT_LICENSE_FILES = COPYING
