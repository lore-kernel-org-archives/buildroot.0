From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 30 Nov 2012 07:32:40 -0800
Subject: [Buildroot] [git commit] scons: add license info
Message-ID: <20121130154710.AD71299369@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=75817ecd1edf2b67b2dcc395df6079182189f577
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/scons/scons.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/scons/scons.mk b/package/scons/scons.mk
index 7cc234e..d2489a0 100644
--- a/package/scons/scons.mk
+++ b/package/scons/scons.mk
@@ -1,6 +1,8 @@
 SCONS_VERSION = 2.0.1
 SCONS_SOURCE = scons-$(SCONS_VERSION).tar.gz
 SCONS_SITE = http://downloads.sourceforge.net/project/scons/scons/$(SCONS_VERSION)
+SCONS_LICENSE = MIT
+SCONS_LICENSE_FILES = LICENSE.txt
 
 define HOST_SCONS_BUILD_CMDS
 	(cd $(@D); python setup.py build)
