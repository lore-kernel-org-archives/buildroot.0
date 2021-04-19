From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Apr 2021 22:26:46 +0200
Subject: [Buildroot] [git commit] package/libgpiod: bump to version 1.6.3
Message-ID: <20210419200052.6AE8C83D65@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8d51ee7c79f437ecb7e661f3bf2623ab786fcac5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libgpiod/libgpiod.hash | 2 +-
 package/libgpiod/libgpiod.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgpiod/libgpiod.hash b/package/libgpiod/libgpiod.hash
index 7b691aaf5e..f0803cab36 100644
--- a/package/libgpiod/libgpiod.hash
+++ b/package/libgpiod/libgpiod.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/libs/libgpiod/sha256sums.asc
-sha256  c601e71846f5ab140c83bc757fdd62a4fda24a9cee39cc5e99c96ec2bf1b06a9  libgpiod-1.6.2.tar.xz
+sha256  841be9d788f00bab08ef22c4be5c39866f0e46cb100a3ae49ed816ac9c5dddc7  libgpiod-1.6.3.tar.xz
 # Hash for license file
 sha256  ce64d5f7b49ea6d80fdb6d4cdee6839d1a94274f7493dc797c3b55b65ec8e9ed  COPYING
diff --git a/package/libgpiod/libgpiod.mk b/package/libgpiod/libgpiod.mk
index 201b697c72..35d003fa33 100644
--- a/package/libgpiod/libgpiod.mk
+++ b/package/libgpiod/libgpiod.mk
@@ -6,7 +6,7 @@
 
 # Be careful when bumping versions.
 # Dependency on kernel header versions may change.
-LIBGPIOD_VERSION = 1.6.2
+LIBGPIOD_VERSION = 1.6.3
 LIBGPIOD_SOURCE = libgpiod-$(LIBGPIOD_VERSION).tar.xz
 LIBGPIOD_SITE = https://www.kernel.org/pub/software/libs/libgpiod
 LIBGPIOD_LICENSE = LGPL-2.1+
