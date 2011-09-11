From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 12 Sep 2011 00:08:17 +0200
Subject: [Buildroot] [git commit] libsamplerate: bump to version 0.1.8
Message-ID: <20110912052628.A51BD8D58C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=46ef8128014ef160e299be53ff64b8b0345b6d99
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/libsamplerate/libsamplerate.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/libsamplerate/libsamplerate.mk b/package/multimedia/libsamplerate/libsamplerate.mk
index 94b07a4..f20026a 100644
--- a/package/multimedia/libsamplerate/libsamplerate.mk
+++ b/package/multimedia/libsamplerate/libsamplerate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSAMPLERATE_VERSION = 0.1.7
+LIBSAMPLERATE_VERSION = 0.1.8
 LIBSAMPLERATE_SITE = http://www.mega-nerd.com/SRC
 LIBSAMPLERATE_INSTALL_STAGING = YES
 LIBSAMPLERATE_DEPENDENCIES = host-pkg-config
-- 
1.7.3.4
