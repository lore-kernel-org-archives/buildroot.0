From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Jan 2021 23:04:06 +0100
Subject: [Buildroot] [git commit] package/sysklogd: bump to version 2.2.1
Message-ID: <20210131214357.CD643815B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fc64bbf528750ddaea583469f3878c74ec4b1bfb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/troglobit/sysklogd/releases/tag/v2.2.1

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sysklogd/sysklogd.hash | 2 +-
 package/sysklogd/sysklogd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sysklogd/sysklogd.hash b/package/sysklogd/sysklogd.hash
index 91550aa0dc..ec14363d9f 100644
--- a/package/sysklogd/sysklogd.hash
+++ b/package/sysklogd/sysklogd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  60546ae50a9f30b31c19ed9a3ad788ce5798025b0f9a0d552c1a04d5eeac494d  sysklogd-2.2.0.tar.gz
+sha256  a93b7ad6a615336f030d8a3257544cff1644908af6a12c65f65482f27bd39ca9  sysklogd-2.2.1.tar.gz
 sha256  7a71d7603a7c4456df441463e54da35acf151c1be0879246de63544f1f34f477  LICENSE
diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index e68526d24c..c6c59da69f 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSKLOGD_VERSION = 2.2.0
+SYSKLOGD_VERSION = 2.2.1
 SYSKLOGD_SITE = https://github.com/troglobit/sysklogd/releases/download/v$(SYSKLOGD_VERSION)
 SYSKLOGD_LICENSE = BSD-3-Clause
 SYSKLOGD_LICENSE_FILES = LICENSE
