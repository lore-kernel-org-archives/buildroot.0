From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  1 Nov 2018 18:05:24 +0100
Subject: [Buildroot] [PATCH 3/3] package/alsa-lib: update upstream status of
 patches
In-Reply-To: <20181101170524.2756-1-thomas.petazzoni@bootlin.com>
References: <20181101170524.2756-1-thomas.petazzoni@bootlin.com>
Message-ID: <20181101170524.2756-3-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The remaining two patches have been submitted upstream for inclusion,
so let's update their upstream status.

While at it, I update @free-electrons.com to @bootlin.com in the first
patch.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/alsa-lib/0001-Don-t-use-fork-on-noMMU-platforms.patch        | 5 +++--
 .../0002-alsa-lib-conditionally-enable-libdl-in-AM_PATH_ALSA-.patch  | 1 +
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/alsa-lib/0001-Don-t-use-fork-on-noMMU-platforms.patch b/package/alsa-lib/0001-Don-t-use-fork-on-noMMU-platforms.patch
index 29cdf8fed8..5bf9dd2057 100644
--- a/package/alsa-lib/0001-Don-t-use-fork-on-noMMU-platforms.patch
+++ b/package/alsa-lib/0001-Don-t-use-fork-on-noMMU-platforms.patch
@@ -1,14 +1,15 @@
 From 41c029755502acf01ed634db437ac06d09be6c41 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Date: Fri, 13 Apr 2018 09:02:37 +0200
 Subject: [PATCH] Don't use fork() on noMMU platforms
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
 
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 [J?rg: update patch for 1.1.6]
 Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+Upstream: http://mailman.alsa-project.org/pipermail/alsa-devel/2018-November/141376.html
 ---
  configure.ac         |  2 ++
  src/pcm/pcm_direct.c | 10 +++++++++-
diff --git a/package/alsa-lib/0002-alsa-lib-conditionally-enable-libdl-in-AM_PATH_ALSA-.patch b/package/alsa-lib/0002-alsa-lib-conditionally-enable-libdl-in-AM_PATH_ALSA-.patch
index 181e56deb4..3aab64e5e8 100644
--- a/package/alsa-lib/0002-alsa-lib-conditionally-enable-libdl-in-AM_PATH_ALSA-.patch
+++ b/package/alsa-lib/0002-alsa-lib-conditionally-enable-libdl-in-AM_PATH_ALSA-.patch
@@ -17,6 +17,7 @@ result to conditionally add -ldl to the list of libraries.
 Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
 [J?rg: update for 1.1.6]
 Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+Upstream: http://mailman.alsa-project.org/pipermail/alsa-devel/2018-November/141377.html
 ---
  utils/alsa.m4 | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
-- 
2.14.4
