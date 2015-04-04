From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Apr 2015 15:49:54 +0200
Subject: [Buildroot] [git commit] jack2: bump version
Message-ID: <20150404135524.E1959818F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=784fba1317c3a4df9f36006a1eefc997712379dd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/jack2/jack2.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/jack2/jack2.mk b/package/jack2/jack2.mk
index 3f52ff4..73328d3 100644
--- a/package/jack2/jack2.mk
+++ b/package/jack2/jack2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JACK2_VERSION = ab409a65df95bc261ff72b52d6b3f4a65cf3266a
+JACK2_VERSION = v1.9.10
 JACK2_SITE = $(call github,jackaudio,jack2,$(JACK2_VERSION))
 JACK2_LICENSE = GPLv2+ (jack server), LGPLv2.1+ (jack library)
 JACK2_DEPENDENCIES = libsamplerate libsndfile alsa-lib host-python
