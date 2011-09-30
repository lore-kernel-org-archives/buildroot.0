From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 30 Sep 2011 10:15:27 +0200
Subject: [Buildroot] [git commit] mpd: ffmpeg needs ipv6,
	so add proper dependencies
Message-ID: <20110930214747.3DFB18DC0F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b2a6615b11281b503227a3d18cffa617ee850147
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/mpd/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/mpd/Config.in b/package/multimedia/mpd/Config.in
index a6ded13..6de1e5b 100644
--- a/package/multimedia/mpd/Config.in
+++ b/package/multimedia/mpd/Config.in
@@ -60,6 +60,7 @@ config BR2_PACKAGE_MPD_FFMPEG
 	bool "ffmpeg"
 	select BR2_PACKAGE_FFMPEG
 	depends on BR2_LARGEFILE
+	depends on BR2_INET_IPV6
 	help
 	  Enable ffmpeg input support.
 	  Select this if you want to play back files supported by ffmpeg.
