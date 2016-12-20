From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Dec 2016 15:36:12 +0100
Subject: [Buildroot] [git commit] sudo: bump to version 1.8.19
Message-ID: <20161220143716.A19C281E49@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e4aa7f84ec4d12bfc507aa2d80c430406cc27abe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
