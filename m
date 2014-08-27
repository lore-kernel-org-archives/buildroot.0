From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Aug 2014 21:35:45 +0200
Subject: [Buildroot] [git commit branch/next] orc: bump version
Message-ID: <20140827193558.640F89D55F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2278046471c56f72a0244636e12dd2bd8cee33f1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/orc/orc.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/orc/orc.mk b/package/orc/orc.mk
index 1bc3828..6637cbb 100644
--- a/package/orc/orc.mk
+++ b/package/orc/orc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ORC_VERSION = 0.4.21
+ORC_VERSION = 0.4.22
 ORC_SOURCE = orc-$(ORC_VERSION).tar.xz
 ORC_SITE = http://gstreamer.freedesktop.org/data/src/orc
 ORC_LICENSE = BSD-2c, BSD-3c
