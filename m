From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 1 Apr 2013 21:02:53 +0200
Subject: [Buildroot] [git commit] fbset: needs host-bison and host-flex
Message-ID: <20130401190256.B912D9B411@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=766d3b93ad0ea6f2693a492efca0a34ae1bc08ba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/08d6d70f7c89617c20e727e77e0f6be09974dfc1/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Tested-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/fbset/fbset.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/fbset/fbset.mk b/package/fbset/fbset.mk
index b8a8f43..920ccc8 100644
--- a/package/fbset/fbset.mk
+++ b/package/fbset/fbset.mk
@@ -7,6 +7,7 @@
 FBSET_VERSION = 2.1
 FBSET_SOURCE = fbset-$(FBSET_VERSION).tar.gz
 FBSET_SITE = http://users.telenet.be/geertu/Linux/fbdev
+FBSET_DEPENDENCIES = host-bison host-flex
 FBSET_LICENSE = GPLv2
 
 # Make sure full fbset wins over busybox fbset
