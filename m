From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Dec 2019 22:38:22 +0100
Subject: [Buildroot] [git commit] package/jo: bump version to 1.3
Message-ID: <20191216213016.AC3168B7A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=59eb1ce7189dfb27f35d1fc803d75f5a7297fd60
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/jo/jo.hash | 2 +-
 package/jo/jo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/jo/jo.hash b/package/jo/jo.hash
index eb5555957f..8190a15e2f 100644
--- a/package/jo/jo.hash
+++ b/package/jo/jo.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 36ec2fc4937c6478467684b18f0b213ff7267d34f5626cd5a0996a39ca64adae  jo-1.2.tar.gz
+sha256 de25c95671a3b392c6bcaba0b15d48eb8e2435508008c29477982d2d2f5ade64  jo-1.3.tar.gz
 sha256 41d8b23dc6e76731f4920b9ce42d0d4a248d243a510319e2441d174a115f35cf  COPYING
diff --git a/package/jo/jo.mk b/package/jo/jo.mk
index 854140de59..5eb013245e 100644
--- a/package/jo/jo.mk
+++ b/package/jo/jo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JO_VERSION = 1.2
+JO_VERSION = 1.3
 JO_SITE = https://github.com/jpmens/jo/releases/download/$(JO_VERSION)
 JO_LICENSE = MIT (json.[ch]), GPL-2.0+ (rest)
 JO_LICENSE_FILES = COPYING
