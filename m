From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Dec 2015 12:26:33 +0100
Subject: [Buildroot] [git commit] exfat-utils: bump to version 1.2.3
Message-ID: <20151229112640.827827FBA8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1212543a38047b1face50caec5bdac1043bbd70f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/exfat-utils/exfat-utils.hash | 2 +-
 package/exfat-utils/exfat-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/exfat-utils/exfat-utils.hash b/package/exfat-utils/exfat-utils.hash
index ebf5638..7bcaa33 100644
--- a/package/exfat-utils/exfat-utils.hash
+++ b/package/exfat-utils/exfat-utils.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	a91bd60c1a05e5421da46a1f7cdca19d6db85f2de0afedf8f0f5ff77f8edbcb4	exfat-utils-1.2.1.tar.gz
+sha256	80d3b3f21242d60d36a38a4ddb05cb7cc3a7d4eef5793e8314814937b938fcea	exfat-utils-1.2.3.tar.gz
diff --git a/package/exfat-utils/exfat-utils.mk b/package/exfat-utils/exfat-utils.mk
index 60eb60f..e6359bc 100644
--- a/package/exfat-utils/exfat-utils.mk
+++ b/package/exfat-utils/exfat-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXFAT_UTILS_VERSION = 1.2.1
+EXFAT_UTILS_VERSION = 1.2.3
 EXFAT_UTILS_SITE = https://github.com/relan/exfat/releases/download/v$(EXFAT_UTILS_VERSION)
 EXFAT_UTILS_LICENSE = GPLv3+
 EXFAT_UTILS_LICENSE_FILES = COPYING
