From: Baruch Siach <baruch@tkos.co.il>
Date: Tue,  6 Mar 2018 08:06:58 +0200
Subject: [Buildroot] [PATCH] ser2net: bump to version 3.5
Message-ID: <a0af4d19ebffe47dca7416e27fb37941e9ca7ceb.1520316418.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove also a redundant dot from description text.

Add upstream hashes, and a license file hash.

Cc: Francisco Gonzalez <gzmorell@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/ser2net/Config.in    | 2 +-
 package/ser2net/ser2net.hash | 6 +++++-
 package/ser2net/ser2net.mk   | 2 +-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/ser2net/Config.in b/package/ser2net/Config.in
index 3f0d15b30d6b..cb4d69f7417d 100644
--- a/package/ser2net/Config.in
+++ b/package/ser2net/Config.in
@@ -3,6 +3,6 @@ config BR2_PACKAGE_SER2NET
 	depends on BR2_USE_MMU # fork()
 	help
 	  Ser2net provides a way for a user to connect from a network
-	  connection to a serial port..
+	  connection to a serial port.
 
 	  http://ser2net.sourceforge.net
diff --git a/package/ser2net/ser2net.hash b/package/ser2net/ser2net.hash
index 67782357685a..c736c726ac45 100644
--- a/package/ser2net/ser2net.hash
+++ b/package/ser2net/ser2net.hash
@@ -1,2 +1,6 @@
+# From https://sourceforge.net/projects/ser2net/files/ser2net/
+md5 e10e7c8c97e5bade5e85ce6e89bdf1f4  ser2net-3.5.tar.gz
+sha1 0ad0affd37ef544c23f42a3f46d09e969d0d9116  ser2net-3.5.tar.gz
 # Locally computed:
-sha256 d846066e27c3072565990745d030357aa0c278f96b7d1d4f59023347c1db8824  ser2net-3.4.tar.gz
+sha256 ba9e1d60a89fd7ed075553b4a2074352902203f7fbd9b65b15048c05f0e3f3be  ser2net-3.5.tar.gz
+sha256 501f3108e6c03e5a0a5585ebaaa369171aead5319cd0a7a4dc1f66211c1f09f1  COPYING
diff --git a/package/ser2net/ser2net.mk b/package/ser2net/ser2net.mk
index 833becc3e0a6..5ab5c4d2ae28 100644
--- a/package/ser2net/ser2net.mk
+++ b/package/ser2net/ser2net.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SER2NET_VERSION = 3.4
+SER2NET_VERSION = 3.5
 SER2NET_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
 SER2NET_LICENSE = GPL-2.0+
 SER2NET_LICENSE_FILES = COPYING
-- 
2.16.1
