From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Jun 2016 11:37:31 +0200
Subject: [Buildroot] [git commit] package/luv: bump to version 1.9.0-3
Message-ID: <20160609093839.A4A837FC73@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e1909dd4ead0e8dba0e42c3eb6c13085b64ea39e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/luv/luv.hash | 2 +-
 package/luv/luv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luv/luv.hash b/package/luv/luv.hash
index 30646d9..8c5bbe3 100644
--- a/package/luv/luv.hash
+++ b/package/luv/luv.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  fab5ba54f141711afc432216d03f3664710798204c78a2a7414479f10b2b2d83  luv-1.9.0-1.tar.gz
+sha256  6d49b899671236d9452c0bb95ea4a0c28aac13a959b9e87347241bc974ddd40b  luv-1.9.0-3.tar.gz
diff --git a/package/luv/luv.mk b/package/luv/luv.mk
index 5e4d048..58686ee 100644
--- a/package/luv/luv.mk
+++ b/package/luv/luv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUV_VERSION = 1.9.0-1
+LUV_VERSION = 1.9.0-3
 LUV_SITE = https://github.com/luvit/luv/releases/download/$(LUV_VERSION)
 LUV_LICENSE = Apache-2.0
 LUV_LICENSE_FILES = LICENSE.txt
