From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Mar 2014 15:16:15 +0100
Subject: [Buildroot] [git commit] tmux: bump to 1.9a
Message-ID: <20140327143327.5C5969C366@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ece176f4f2c39547b2d54edcd6a44d2e3619b1b4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tmux/tmux.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/tmux/tmux.mk b/package/tmux/tmux.mk
index 3f5f893..6288e0b 100644
--- a/package/tmux/tmux.mk
+++ b/package/tmux/tmux.mk
@@ -4,7 +4,7 @@
 #
 ###############################################################################
 
-TMUX_VERSION = 1.8
+TMUX_VERSION = 1.9a
 TMUX_SITE = http://downloads.sourceforge.net/tmux
 TMUX_LICENSE = ISC
 TMUX_LICENSE_FILES = README
