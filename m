From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 20 Dec 2016 10:39:14 -0300
Subject: [Buildroot] [PATCH] sudo: bump to version 1.8.19
Message-ID: <20161220133914.16352-1-gustavo@zacarias.com.ar>
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
index c6f5be3..5db547f 100644
--- a/package/sudo/sudo.hash
+++ b/package/sudo/sudo.hash
@@ -1,2 +1,2 @@
 # From: http://www.sudo.ws/download.html
-sha256 e5a0471c721281a693025bbde33ebd9d3db43245d83ab8516bbfc23980379434  sudo-1.8.18p1.tar.gz
+sha256 1130923534b62c18b40b529c6877d1a020db93f876617b56a569d0a1133d0228  sudo-1.8.19.tar.gz
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 3643d55..ee245a1 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUDO_VERSION = 1.8.18p1
+SUDO_VERSION = 1.8.19
 SUDO_SITE = http://www.sudo.ws/sudo/dist
 SUDO_LICENSE = ISC BSD-3c
 SUDO_LICENSE_FILES = doc/LICENSE
-- 
2.10.2
