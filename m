From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Oct 2018 10:03:42 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/mjpg-streamer: bump version
In-Reply-To: <20181020080343.32067-1-bernd.kuhls@t-online.de>
References: <20181020080343.32067-1-bernd.kuhls@t-online.de>
Message-ID: <20181020080343.32067-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This bump includes

https://github.com/jacksonliam/mjpg-streamer/commit/588db286da461ac5c02277b511ab58a7bf3f752f
https://github.com/jacksonliam/mjpg-streamer/commit/3b7d04d28a39bc697f5bd77f1072430692ac9f8b

which fixes building without c++:

http://autobuild.buildroot.net/results/1da/1da75a9d9b6e4d04d39117d2915c1d195dcae002/
http://autobuild.buildroot.net/results/3da/3da3f4099ccf62a314c099c5720dd5b1e9463914/
http://autobuild.buildroot.net/results/104/10438190453bd7ef7cc157929e74a9ffce9f7fdf/
http://autobuild.buildroot.net/results/91f/91fa80348db0c248649fe003df2dfa854f37a5a2/
http://autobuild.buildroot.net/results/4d7/4d7e722cf85a54d2813715e6b4ca1dd793e6d237/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: bumped package after patches were committed upstream

 package/mjpg-streamer/mjpg-streamer.hash | 2 +-
 package/mjpg-streamer/mjpg-streamer.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mjpg-streamer/mjpg-streamer.hash b/package/mjpg-streamer/mjpg-streamer.hash
index f544550c53..a98aaffffd 100644
--- a/package/mjpg-streamer/mjpg-streamer.hash
+++ b/package/mjpg-streamer/mjpg-streamer.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 094fda686ef63e5167cbef81b5ac6aea74fa98ea2674fa4eba3bc6ba29cc5857  mjpg-streamer-f387bb44e6c087271b763b27da998bf2e06c4f5d.tar.gz
+sha256 617c6cdcf5ad6e9135e8bcd83d7acd33cc4a563b9104bca7def57d807164ae89  mjpg-streamer-75c6c4a7809c735b201df949d55287fb60397744.tar.gz
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  mjpg-streamer-experimental/LICENSE
diff --git a/package/mjpg-streamer/mjpg-streamer.mk b/package/mjpg-streamer/mjpg-streamer.mk
index e5de847825..c09d55b727 100644
--- a/package/mjpg-streamer/mjpg-streamer.mk
+++ b/package/mjpg-streamer/mjpg-streamer.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MJPG_STREAMER_VERSION = f387bb44e6c087271b763b27da998bf2e06c4f5d
+MJPG_STREAMER_VERSION = 75c6c4a7809c735b201df949d55287fb60397744
 MJPG_STREAMER_SITE = $(call github,jacksonliam,mjpg-streamer,$(MJPG_STREAMER_VERSION))
 MJPG_STREAMER_SUBDIR = mjpg-streamer-experimental
 MJPG_STREAMER_LICENSE = GPL-2.0+
-- 
2.19.1
