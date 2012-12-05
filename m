From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 5 Dec 2012 00:39:24 -0800
Subject: [Buildroot] [git commit] scons: bump to version 2.2.0
Message-ID: <20121205091356.A4631999F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=11baa844194ab053298f966641e7081c40a394ea
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/scons/scons.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/scons/scons.mk b/package/scons/scons.mk
index d2489a0..79fd6b1 100644
--- a/package/scons/scons.mk
+++ b/package/scons/scons.mk
@@ -1,4 +1,4 @@
-SCONS_VERSION = 2.0.1
+SCONS_VERSION = 2.2.0
 SCONS_SOURCE = scons-$(SCONS_VERSION).tar.gz
 SCONS_SITE = http://downloads.sourceforge.net/project/scons/scons/$(SCONS_VERSION)
 SCONS_LICENSE = MIT
