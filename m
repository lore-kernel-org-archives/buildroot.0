From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 4 May 2016 22:46:12 +0200
Subject: [Buildroot] [git commit] vlc: bump version to 2.2.3
Message-ID: <20160504205128.88CFB802B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8413f98999cd5f24a0d54259fd1ecd8ae564b439
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vlc/vlc.hash | 4 ++--
 package/vlc/vlc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/vlc/vlc.hash b/package/vlc/vlc.hash
index 6754b82..04632e0 100644
--- a/package/vlc/vlc.hash
+++ b/package/vlc/vlc.hash
@@ -1,2 +1,2 @@
-# From http://download.videolan.org/pub/videolan/vlc/2.2.2/vlc-2.2.2.tar.xz.sha256
-sha256	9ad23128be16f9b40ed772961272cb0748ed8e4aa1bc79c129e589feebea5fb5	vlc-2.2.2.tar.xz
+# From http://download.videolan.org/pub/videolan/vlc/2.2.3/vlc-2.2.3.tar.xz.sha256
+sha256 b9d7587d35f13c3c981964c8cc8b03f1c7c8edf528be476b3ca1d2efedd5bf5b  vlc-2.2.3.tar.xz
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 46a7cad..30887bd 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VLC_VERSION = 2.2.2
+VLC_VERSION = 2.2.3
 VLC_SITE = http://get.videolan.org/vlc/$(VLC_VERSION)
 VLC_SOURCE = vlc-$(VLC_VERSION).tar.xz
 VLC_LICENSE = GPLv2+ LGPLv2.1+
