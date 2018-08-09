From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 9 Aug 2018 10:30:20 +0200
Subject: [Buildroot] [git commit branch/next] micropython: bump version to
 v1.9.4
Message-ID: <20180809082413.DD20E8B66F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0095a8f38048435144bbf9a59819752ef5fb5726
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/micropython/micropython.hash | 2 +-
 package/micropython/micropython.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/micropython/micropython.hash b/package/micropython/micropython.hash
index d42d7ee148..88068a60f3 100644
--- a/package/micropython/micropython.hash
+++ b/package/micropython/micropython.hash
@@ -1,2 +1,2 @@
 #locally computed
-sha256 ce6b5c4548e85d84075635ff3e94d5cd3356b5fcc7593a7b49dd513612b6ed01  micropython-v1.9.3.tar.gz
+sha256 9a66205d0ba3dff6dcc98119f104cd59c15855c6c030a190ca02354be52836c1  micropython-v1.9.4.tar.gz
diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index 2c6bddd81d..cff8b17b14 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MICROPYTHON_VERSION = v1.9.3
+MICROPYTHON_VERSION = v1.9.4
 MICROPYTHON_SITE = $(call github,micropython,micropython,$(MICROPYTHON_VERSION))
 MICROPYTHON_LICENSE = MIT
 MICROPYTHON_LICENSE_FILES = LICENSE
