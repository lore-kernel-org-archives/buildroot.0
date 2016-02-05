From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Feb 2016 21:47:51 +0100
Subject: [Buildroot] [git commit] grep: bump to version 2.23
Message-ID: <20160205205333.4120181739@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=59cbadbaf7836cb4d2949463a9281a21782df167
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/grep/grep.hash | 2 +-
 package/grep/grep.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/grep/grep.hash b/package/grep/grep.hash
index 4019db1..5c49da2 100644
--- a/package/grep/grep.hash
+++ b/package/grep/grep.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking signature
-sha256	ca91d22f017bfcb503d4bc3b44295491c89a33a3df0c3d8b8614f2d3831836eb	grep-2.22.tar.xz
+sha256	54fc478ee1ce17780109820ef30730c9e18715a949f7d5c6afc673adb2a56ecf	grep-2.23.tar.xz
diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index 447ed65..65ef469 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GREP_VERSION = 2.22
+GREP_VERSION = 2.23
 GREP_SITE = $(BR2_GNU_MIRROR)/grep
 GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
 GREP_LICENSE = GPLv3+
