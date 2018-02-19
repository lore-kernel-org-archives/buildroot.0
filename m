From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Feb 2018 20:51:49 +0100
Subject: [Buildroot] [git commit] inadyn: bump version to 2.3
Message-ID: <20180305200716.B55648126F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c8e60ff15eacc496eae053a93e15e5c0d8f284e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/inadyn/inadyn.hash | 6 +++---
 package/inadyn/inadyn.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/inadyn/inadyn.hash b/package/inadyn/inadyn.hash
index c6c062ce15..742b6f226f 100644
--- a/package/inadyn/inadyn.hash
+++ b/package/inadyn/inadyn.hash
@@ -1,5 +1,5 @@
-# From https://github.com/troglobit/inadyn/releases/download/v2.2.1/inadyn-2.2.1.tar.xz.md5
-md5 8f7796ee45b2a2e282a54a2d31d03953  inadyn-2.2.1.tar.xz
+# From https://github.com/troglobit/inadyn/releases/download/v2.3/inadyn-2.3.tar.xz.md5
+md5 63efb284b7f3f389c01bad19ee28407e  inadyn-2.3.tar.xz
 # Locally computed
-sha256 e7a74fcf8b7c069990940c0dc4d4d18071005be225667fdfcfa4156c44384579  inadyn-2.2.1.tar.xz
+sha256 4a98b80d8565b9e4cb32b19b7a8b06a22a7d9a6f4f03a5298a8d441b6187c760  inadyn-2.3.tar.xz
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/inadyn/inadyn.mk b/package/inadyn/inadyn.mk
index 5eac3b5c3a..0b1f82dae8 100644
--- a/package/inadyn/inadyn.mk
+++ b/package/inadyn/inadyn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INADYN_VERSION = 2.2.1
+INADYN_VERSION = 2.3
 INADYN_SITE = https://github.com/troglobit/inadyn/releases/download/v$(INADYN_VERSION)
 INADYN_SOURCE = inadyn-$(INADYN_VERSION).tar.xz
 INADYN_LICENSE = GPL-2.0+
