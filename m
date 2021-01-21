From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 21 Jan 2021 22:39:39 +0100
Subject: [Buildroot] [git commit] package/jack2: bump to version 1.9.17
Message-ID: <20210121212024.4EF9388F36@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e51e35f352ac9f13b68d2302b659a8f32bc703e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Add COPYING as a license files, available since version 1.9.15 and
  https://github.com/jackaudio/jack2/commit/d75ddb82304bf500b031f52c11b0a106e2dc9a55
- Update indentation in hash file (two spaces)

https://github.com/jackaudio/jack2/releases/tag/v1.9.15
https://github.com/jackaudio/jack2/releases/tag/v1.9.16
https://github.com/jackaudio/jack2/releases/tag/v1.9.17

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/jack2/jack2.hash | 3 ++-
 package/jack2/jack2.mk   | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/jack2/jack2.hash b/package/jack2/jack2.hash
index aec56e24a4..df708f7ca5 100644
--- a/package/jack2/jack2.hash
+++ b/package/jack2/jack2.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 a20a32366780c0061fd58fbb5f09e514ea9b7ce6e53b080a44b11a558a83217c  jack2-1.9.14.tar.gz
+sha256  38f674bbc57852a8eb3d9faa1f96a0912d26f7d5df14c11005ad499c8ae352f2  jack2-1.9.17.tar.gz
+sha256  d8c320ffc0030d1b096ae4732b50d2b811cf95e9a9b7377c1127b2563e0a0388  COPYING
diff --git a/package/jack2/jack2.mk b/package/jack2/jack2.mk
index db63b7f4b7..d09b54b35c 100644
--- a/package/jack2/jack2.mk
+++ b/package/jack2/jack2.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-JACK2_VERSION = 1.9.14
+JACK2_VERSION = 1.9.17
 JACK2_SITE = $(call github,jackaudio,jack2,v$(JACK2_VERSION))
 JACK2_LICENSE = GPL-2.0+ (jack server), LGPL-2.1+ (jack library)
+JACK2_LICENSE_FILES = COPYING
 JACK2_DEPENDENCIES = libsamplerate libsndfile alsa-lib
 JACK2_INSTALL_STAGING = YES
 
