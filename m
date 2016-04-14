From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Apr 2016 14:37:51 +0200
Subject: [Buildroot] [git commit] luv: bump to version 1.9.0-1
Message-ID: <20160414123802.452CB7FB05@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e2c7eef907ac883f96ca723217e9326c6f2922b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/luv/luv.hash | 2 +-
 package/luv/luv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luv/luv.hash b/package/luv/luv.hash
index 934ec15..30646d9 100644
--- a/package/luv/luv.hash
+++ b/package/luv/luv.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  e1aef90bcd6993048102acd8260ca895fece49fbe6c03a4c22cf6c67eba68fb5  luv-1.8.0-4.tar.gz
+sha256  fab5ba54f141711afc432216d03f3664710798204c78a2a7414479f10b2b2d83  luv-1.9.0-1.tar.gz
diff --git a/package/luv/luv.mk b/package/luv/luv.mk
index 69fabf8..5e4d048 100644
--- a/package/luv/luv.mk
+++ b/package/luv/luv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUV_VERSION = 1.8.0-4
+LUV_VERSION = 1.9.0-1
 LUV_SITE = https://github.com/luvit/luv/releases/download/$(LUV_VERSION)
 LUV_LICENSE = Apache-2.0
 LUV_LICENSE_FILES = LICENSE.txt
