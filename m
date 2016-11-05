From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  5 Nov 2016 16:57:53 +0100
Subject: [Buildroot] [PATCH/next 2/2] package/sudo: bump version to 1.8.18p1
In-Reply-To: <20161105155753.25503-1-bernd.kuhls@t-online.de>
References: <20161105155753.25503-1-bernd.kuhls@t-online.de>
Message-ID: <20161105155753.25503-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
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
-- 
2.10.2
