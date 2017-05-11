From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 11 May 2017 10:36:02 +0100
Subject: [Buildroot] [PATCH next] sudo: bump version to 1.8.20
Message-ID: <20170511093602.12019-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/sudo/sudo.hash | 2 +-
 package/sudo/sudo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sudo/sudo.hash b/package/sudo/sudo.hash
index 82e1ad6..63b1dd0 100644
--- a/package/sudo/sudo.hash
+++ b/package/sudo/sudo.hash
@@ -1,2 +1,2 @@
 # From: http://www.sudo.ws/download.html
-sha256 237e18e67c2ad59ecacfa4b7707198b09fcf84914621585a9bc670dcc31a52e0  sudo-1.8.19p2.tar.gz
+sha256 9e97b8da859c6cc1b5b8c31db93002b750eae16af1bbda9140f8dd85b970e0e0  sudo-1.8.20.tar.gz
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 0fcd740..60767a3 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUDO_VERSION = 1.8.19p2
+SUDO_VERSION = 1.8.20
 SUDO_SITE = http://www.sudo.ws/sudo/dist
 SUDO_LICENSE = ISC, BSD-3-Clause
 SUDO_LICENSE_FILES = doc/LICENSE
-- 
2.10.2
