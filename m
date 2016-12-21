From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Dec 2016 15:12:37 +0100
Subject: [Buildroot] [git commit] sudo: bump to version 1.8.19p1
Message-ID: <20161221141352.0ECBD80559@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=942dad3a531e1a594c4d63fbb714f237d06803ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sudo/sudo.hash | 2 +-
 package/sudo/sudo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sudo/sudo.hash b/package/sudo/sudo.hash
index 5db547f..ef67392 100644
--- a/package/sudo/sudo.hash
+++ b/package/sudo/sudo.hash
@@ -1,2 +1,2 @@
 # From: http://www.sudo.ws/download.html
-sha256 1130923534b62c18b40b529c6877d1a020db93f876617b56a569d0a1133d0228  sudo-1.8.19.tar.gz
+sha256 b8afb1cf8736b6c61f171f2bf4b174818d9e00e92ef73da55fabcd01286ffc92  sudo-1.8.19p1.tar.gz
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index ee245a1..bc2a47b 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUDO_VERSION = 1.8.19
+SUDO_VERSION = 1.8.19p1
 SUDO_SITE = http://www.sudo.ws/sudo/dist
 SUDO_LICENSE = ISC BSD-3c
 SUDO_LICENSE_FILES = doc/LICENSE
