From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Feb 2016 21:20:21 +0100
Subject: [Buildroot] [git commit] micropython: bump to v1.6
Message-ID: <20160206202026.2C7F580771@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=06d41cd77ae5378bc77dc1e0b327d6122ba6e659
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/micropython/micropython.hash | 2 +-
 package/micropython/micropython.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/micropython/micropython.hash b/package/micropython/micropython.hash
index 0c9e2ae..b3a7c22 100644
--- a/package/micropython/micropython.hash
+++ b/package/micropython/micropython.hash
@@ -1,2 +1,2 @@
 #locally computed
-sha256 3c594ee701622f01c4e9c7abd1c322a0bc6c8af17bea0b0126812cb8e61bb5d9  micropython-v1.5.2.tar.gz
+sha256 f8ea3faffa797de1a06c16c8f57c784c665b318ca08ac17f74dcbc95322d47de  micropython-v1.6.tar.gz
diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index 59d164f..853caa2 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MICROPYTHON_VERSION = v1.5.2
+MICROPYTHON_VERSION = v1.6
 MICROPYTHON_SITE = $(call github,micropython,micropython,$(MICROPYTHON_VERSION))
 MICROPYTHON_LICENSE = MIT
 MICROPYTHON_LICENSE_FILES = LICENSE
