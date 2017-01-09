From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 9 Jan 2017 17:20:34 +0000
Subject: [Buildroot] [PATCH] ser2net: bump version to 3.3
Message-ID: <20170109172034.7033-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/ser2net/ser2net.hash | 2 +-
 package/ser2net/ser2net.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ser2net/ser2net.hash b/package/ser2net/ser2net.hash
index 1b93643..ae45e9c 100644
--- a/package/ser2net/ser2net.hash
+++ b/package/ser2net/ser2net.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256 e91cf85ab2c1769e17be7726b133f8f3ad197e9d4b445bb0b0d2f3f97f88a083  ser2net-3.2.tar.gz
+sha256 3d1cef5f48df8291e57d4d7d4eac2fc809ae644a5524ffca4aebef0f4e4153dc  ser2net-3.3.tar.gz
diff --git a/package/ser2net/ser2net.mk b/package/ser2net/ser2net.mk
index b33512e..a786b1a 100644
--- a/package/ser2net/ser2net.mk
+++ b/package/ser2net/ser2net.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SER2NET_VERSION = 3.2
+SER2NET_VERSION = 3.3
 SER2NET_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
 SER2NET_LICENSE = GPLv2+
 SER2NET_LICENSE_FILES = COPYING
-- 
2.10.2
