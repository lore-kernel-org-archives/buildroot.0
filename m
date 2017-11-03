From: Ryan Coe <bluemrp9@gmail.com>
Date: Fri,  3 Nov 2017 06:30:04 -0700
Subject: [Buildroot] [PATCH 3/3] inadyn: bump version to 2.2.1
In-Reply-To: <20171103133004.8083-1-bluemrp9@gmail.com>
References: <20171103133004.8083-1-bluemrp9@gmail.com>
Message-ID: <20171103133004.8083-3-bluemrp9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash for license file.

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
---
 package/inadyn/inadyn.hash | 7 ++++---
 package/inadyn/inadyn.mk   | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/inadyn/inadyn.hash b/package/inadyn/inadyn.hash
index f573be2862..c6c062ce15 100644
--- a/package/inadyn/inadyn.hash
+++ b/package/inadyn/inadyn.hash
@@ -1,4 +1,5 @@
-# From https://github.com/troglobit/inadyn/releases/download/v2.1/inadyn-2.1.tar.xz.md5
-md5 b410684e38e628284a631ec763c2fdb8  inadyn-2.1.tar.xz
+# From https://github.com/troglobit/inadyn/releases/download/v2.2.1/inadyn-2.2.1.tar.xz.md5
+md5 8f7796ee45b2a2e282a54a2d31d03953  inadyn-2.2.1.tar.xz
 # Locally computed
-sha256 87639a7c1ddc047074601ad60188279a2a0d9393367f046c153de0e24586b3ac  inadyn-2.1.tar.xz
+sha256 e7a74fcf8b7c069990940c0dc4d4d18071005be225667fdfcfa4156c44384579  inadyn-2.2.1.tar.xz
+sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/inadyn/inadyn.mk b/package/inadyn/inadyn.mk
index 0ef8b5a520..5eac3b5c3a 100644
--- a/package/inadyn/inadyn.mk
+++ b/package/inadyn/inadyn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INADYN_VERSION = 2.1
+INADYN_VERSION = 2.2.1
 INADYN_SITE = https://github.com/troglobit/inadyn/releases/download/v$(INADYN_VERSION)
 INADYN_SOURCE = inadyn-$(INADYN_VERSION).tar.xz
 INADYN_LICENSE = GPL-2.0+
-- 
2.15.0
