From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 13:34:45 +0200
Subject: [Buildroot] [git commit] softether: bump to v4.22-9634-beta
Message-ID: <20171021115856.1FA0D80FB8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7581e4f4d2de74062c3e2b6e38d27d5aec50855f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add a sha256sum for the license file.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/softether/softether.hash | 3 ++-
 package/softether/softether.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/softether/softether.hash b/package/softether/softether.hash
index 01de107..ec6e060 100644
--- a/package/softether/softether.hash
+++ b/package/softether/softether.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 a34dca9bdb940f9384ae50096f6485448ca539c557e36b3a7f6f810831ee5946 softether-e9006faf0c8739147ab97e27fe11c5cdd20ed9e6.tar.gz
+sha256 8e6310d36e579ea07171ce5fcb9ebe31235d218444c4e4836ca6c32aa49c1f93 softether-v4.22-9634-beta.tar.gz
+sha256 7aeb873293fa0e44425dabf68a8e46e26c848fe58efcfd3ac7c90a3386f3edd1 LICENSE
diff --git a/package/softether/softether.mk b/package/softether/softether.mk
index 5868438..77ce408 100644
--- a/package/softether/softether.mk
+++ b/package/softether/softether.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SOFTETHER_VERSION = e9006faf0c8739147ab97e27fe11c5cdd20ed9e6
+SOFTETHER_VERSION = v4.22-9634-beta
 SOFTETHER_SITE = $(call github,SoftEtherVPN,SoftEtherVPN,$(SOFTETHER_VERSION))
 SOFTETHER_LICENSE = GPL-2.0
 SOFTETHER_LICENSE_FILES = LICENSE
