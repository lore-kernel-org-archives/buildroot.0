From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Nov 2016 23:32:06 +0100
Subject: [Buildroot] [git commit branch/next] package/sudo: bump version to
	1.8.18p1
Message-ID: <20161105223210.54F3A80049@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dbc5f228b219d9b05a048303ddbd624da3411dd2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sudo/sudo.hash | 2 +-
 package/sudo/sudo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sudo/sudo.hash b/package/sudo/sudo.hash
index 4c2431f..c6f5be3 100644
--- a/package/sudo/sudo.hash
+++ b/package/sudo/sudo.hash
@@ -1,2 +1,2 @@
 # From: http://www.sudo.ws/download.html
-sha256 4316381708324da8b6cb151f655c1a11855207c7c02244d8ffdea5104d7cc308  sudo-1.8.15.tar.gz
+sha256 e5a0471c721281a693025bbde33ebd9d3db43245d83ab8516bbfc23980379434  sudo-1.8.18p1.tar.gz
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 89859dd..3643d55 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUDO_VERSION = 1.8.15
+SUDO_VERSION = 1.8.18p1
 SUDO_SITE = http://www.sudo.ws/sudo/dist
 SUDO_LICENSE = ISC BSD-3c
 SUDO_LICENSE_FILES = doc/LICENSE
