From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Jan 2020 17:48:16 +0100
Subject: [Buildroot] [git commit] package/rpi-userland: bump version to
 06bc6da
Message-ID: <20200127163929.ADAF383C77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=068160f46a84a0ea54690b6849e99e2cdeebd472
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpi-userland/rpi-userland.hash | 2 +-
 package/rpi-userland/rpi-userland.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-userland/rpi-userland.hash b/package/rpi-userland/rpi-userland.hash
index 6d59f2aafc..b6d9b99b3c 100644
--- a/package/rpi-userland/rpi-userland.hash
+++ b/package/rpi-userland/rpi-userland.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 d6231e9fa33c805cf7cbb559a0d6eb125605fc2ba862d9e5a3248778dd269859 rpi-userland-5070cb7fc150fc98f1ed64a7739c3356970d9f76.tar.gz
+sha256 cf4dff40a2f4ec38bc7e42a80b989df1bf88e12d714f7e681f83c4e5a588f5c9 rpi-userland-06bc6daa02137ca72b7a2104afad81e82a44de17.tar.gz
 sha256 bee6f1249175683d8610651706e1aa7dffcbfd3f9c4c05bc1e5ab34f313c2db5 LICENCE
diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 2b672b6c97..7dd29e88e7 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_USERLAND_VERSION = 5070cb7fc150fc98f1ed64a7739c3356970d9f76
+RPI_USERLAND_VERSION = 06bc6daa02137ca72b7a2104afad81e82a44de17
 RPI_USERLAND_SITE = $(call github,raspberrypi,userland,$(RPI_USERLAND_VERSION))
 RPI_USERLAND_LICENSE = BSD-3-Clause
 RPI_USERLAND_LICENSE_FILES = LICENCE
