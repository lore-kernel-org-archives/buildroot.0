From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 5 May 2012 23:41:25 +0200
Subject: [Buildroot] [git commit] package/multimedia: drop libraries,
	it's just applications now
Message-ID: <20120505214225.7570D96AA8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7446d9471ceef1a1bf81cf5882cdab3d12237c71
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 895dde6..afe4a23 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -1,4 +1,4 @@
-menu "Audio and video libraries and applications"
+menu "Audio and video applications"
 source "package/multimedia/alsa-utils/Config.in"
 source "package/multimedia/aumix/Config.in"
 source "package/multimedia/bellagio/Config.in"
