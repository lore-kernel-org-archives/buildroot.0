From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 16 Jan 2017 10:50:22 -0300
Subject: [Buildroot] [PATCH] sudo: bump to version 1.8.19p2
Message-ID: <20170116135022.27830-1-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/sudo/sudo.hash | 2 +-
 package/sudo/sudo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sudo/sudo.hash b/package/sudo/sudo.hash
index ef67392..82e1ad6 100644
--- a/package/sudo/sudo.hash
+++ b/package/sudo/sudo.hash
@@ -1,2 +1,2 @@
 # From: http://www.sudo.ws/download.html
-sha256 b8afb1cf8736b6c61f171f2bf4b174818d9e00e92ef73da55fabcd01286ffc92  sudo-1.8.19p1.tar.gz
+sha256 237e18e67c2ad59ecacfa4b7707198b09fcf84914621585a9bc670dcc31a52e0  sudo-1.8.19p2.tar.gz
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index bc2a47b..12b16e0 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUDO_VERSION = 1.8.19p1
+SUDO_VERSION = 1.8.19p2
 SUDO_SITE = http://www.sudo.ws/sudo/dist
 SUDO_LICENSE = ISC BSD-3c
 SUDO_LICENSE_FILES = doc/LICENSE
-- 
2.10.2
