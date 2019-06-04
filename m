From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Jun 2019 23:41:23 +0200
Subject: [Buildroot] [git commit] package/nanomsg: bump version to 1.1.5
Message-ID: <20190604214833.D133F8EF29@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=487922329abcf343b22705a94095f3c8ae23a738
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Brett Gyarfas <brett.gyarfas@ontera.bio>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nanomsg/nanomsg.hash | 4 ++--
 package/nanomsg/nanomsg.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nanomsg/nanomsg.hash b/package/nanomsg/nanomsg.hash
index 5164a754ea..ed67a7e3ff 100644
--- a/package/nanomsg/nanomsg.hash
+++ b/package/nanomsg/nanomsg.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256 24afdeb71b2e362e8a003a7ecc906e1b84fd9f56ce15ec567481d1bb33132cc7  nanomsg-1.0.0.tar.gz
+sha256 218b31ae1534ab897cb5c419973603de9ca1a5f54df2e724ab4a188eb416df5a  nanomsg-1.1.5.tar.gz
 
 # Hash for license file:
-sha256 4e51f6a04312ea7c5f4f0e92d91b6415c1eeb09bdaf86a6fd11d93499457c07a  COPYING
+sha256 9755181e27175cb3510b4da8629caa406fb355a19aa8e7d55f06bf8ab33323c4  COPYING
diff --git a/package/nanomsg/nanomsg.mk b/package/nanomsg/nanomsg.mk
index 3b1c2ca0c4..b86e8c128a 100644
--- a/package/nanomsg/nanomsg.mk
+++ b/package/nanomsg/nanomsg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NANOMSG_VERSION = 1.0.0
+NANOMSG_VERSION = 1.1.5
 NANOMSG_SITE = $(call github,nanomsg,nanomsg,$(NANOMSG_VERSION))
 NANOMSG_INSTALL_STAGING = YES
 NANOMSG_LICENSE = MIT
