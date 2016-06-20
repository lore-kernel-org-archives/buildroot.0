From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Jun 2016 15:07:39 +0200
Subject: [Buildroot] [git commit] Revert "package/gstreamer1: add hash file"
Message-ID: <20160620131803.0D20682103@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=04b687cbe2f6201b831876c2e5762e64aef35311
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 048e97ebde04e822b50352baddc4278788ef737e.

As noticed by Gustavo, we already had a sha256 hash from upstream, so adding
one more doesn't make any sense.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gstreamer1/gstreamer1/gstreamer1.hash | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/gstreamer1/gstreamer1/gstreamer1.hash b/package/gstreamer1/gstreamer1/gstreamer1.hash
index 094c6d0..b32fcfe 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.hash
+++ b/package/gstreamer1/gstreamer1/gstreamer1.hash
@@ -1,4 +1,2 @@
 # From http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-1.8.2.tar.xz.sha256sum
 sha256	9dbebe079c2ab2004ef7f2649fa317cabea1feb4fb5605c24d40744b90918341  gstreamer-1.8.2.tar.xz
-# locally computed
-sha256  9dbebe079c2ab2004ef7f2649fa317cabea1feb4fb5605c24d40744b90918341  gstreamer-1.8.2.tar.xz
