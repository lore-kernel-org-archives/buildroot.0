From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Feb 2017 15:49:25 +0100
Subject: [Buildroot] [git commit] x264: bump to version
	97eaef2ab82a46d13ea5e00270712d6475fbe42b
Message-ID: <20170206145008.68B6F818F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0437dcc33ce6f52b0a7b3b9674352cca789c297a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x264/x264.hash | 2 +-
 package/x264/x264.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x264/x264.hash b/package/x264/x264.hash
index c61e2a2..9551093 100644
--- a/package/x264/x264.hash
+++ b/package/x264/x264.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 888af681679374fa5147ba629eab8cf1704864ddd9ad6be3a8057a6c86bc9392  x264-b97ae0644f16bad2e2c9c9181264a946769a0aa0.tar.gz
+sha256 9fc4651981453d0428a2ad16889b6b63d1f2e7347ea321f20347fc3a021ee912  x264-97eaef2ab82a46d13ea5e00270712d6475fbe42b.tar.gz
diff --git a/package/x264/x264.mk b/package/x264/x264.mk
index aa7bb55..80437c4 100644
--- a/package/x264/x264.mk
+++ b/package/x264/x264.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-X264_VERSION = b97ae0644f16bad2e2c9c9181264a946769a0aa0
+X264_VERSION = 97eaef2ab82a46d13ea5e00270712d6475fbe42b
 X264_SITE = git://git.videolan.org/x264.git
 X264_LICENSE = GPLv2+
 X264_DEPENDENCIES = host-pkgconf
