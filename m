From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 24 Apr 2014 11:09:37 +0200
Subject: [Buildroot] [PATCH] jack2: bump version to
 ab409a65df95bc261ff72b52d6b3f4a65cf3266a
Message-ID: <25faea136ec8cf425d6f.1398330577@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/dfc/dfc9850a128ef46acc6bbc066656a692da08db04/build-end.log
thanks to commit
https://github.com/jackaudio/jack2/commit/80976954453395cdcf1d2a29acfced2a9391e48a

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/jack2/jack2.mk |  2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/jack2/jack2.mk b/package/jack2/jack2.mk
--- a/package/jack2/jack2.mk
+++ b/package/jack2/jack2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JACK2_VERSION = 37976441044d69b91d61d8f6278949a39cf1b7b7
+JACK2_VERSION = ab409a65df95bc261ff72b52d6b3f4a65cf3266a
 JACK2_SITE = $(call github,jackaudio,jack2,$(JACK2_VERSION))
 JACK2_LICENSE = GPLv2+ (jack server), LGPLv2.1+ (jack library)
 JACK2_DEPENDENCIES = libsamplerate libsndfile alsa-lib
