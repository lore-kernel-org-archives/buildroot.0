From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 12 May 2021 08:31:03 +0200
Subject: [Buildroot] [git commit] package/sysklogd: bump to version 2.2.3
Message-ID: <20210512060257.8C31E815DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8036c23d5964cf924d8857cf1a8f711404458950
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/troglobit/sysklogd/releases/tag/v2.2.3

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sysklogd/sysklogd.hash | 5 ++++-
 package/sysklogd/sysklogd.mk   | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/sysklogd/sysklogd.hash b/package/sysklogd/sysklogd.hash
index 0ef5e17116..6d3ba8f960 100644
--- a/package/sysklogd/sysklogd.hash
+++ b/package/sysklogd/sysklogd.hash
@@ -1,3 +1,6 @@
+# Upstream .md5 and .sha256 from GitHub
+md5 2c6749c49f52b8c5dad18e9a9315e7dd  sysklogd-2.2.3.tar.gz
+sha256 e7ea09c15511a63c430e84f65ce3bf55a0386ee419ab52e9341c4a9fabae59ad  sysklogd-2.2.3.tar.gz
+
 # Locally calculated
-sha256  2752a693a2486f7e532b6b028296c8ac0a97def8a4848f1e915f3e583fd0b4b6  sysklogd-2.2.2.tar.gz
 sha256  7a71d7603a7c4456df441463e54da35acf151c1be0879246de63544f1f34f477  LICENSE
diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index 0110974069..7c5de95743 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSKLOGD_VERSION = 2.2.2
+SYSKLOGD_VERSION = 2.2.3
 SYSKLOGD_SITE = https://github.com/troglobit/sysklogd/releases/download/v$(SYSKLOGD_VERSION)
 SYSKLOGD_LICENSE = BSD-3-Clause
 SYSKLOGD_LICENSE_FILES = LICENSE
