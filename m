From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 8 Feb 2012 21:11:25 +0100
Subject: [Buildroot] [git commit] kmod: bump to 5
Message-ID: <20120208210842.D072F90A38@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d390906f667ec9486e5a4f29d3e5a2c6a938d62c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/kmod/kmod.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index 0e3bc34..acf5f0a 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -1,4 +1,4 @@
-KMOD_VERSION = 4
+KMOD_VERSION = 5
 KMOD_SOURCE = kmod-$(KMOD_VERSION).tar.xz
 KMOD_SITE = http://packages.profusion.mobi/kmod/
 KMOD_INSTALL_STAGING = YES
