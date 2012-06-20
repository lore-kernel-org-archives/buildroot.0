From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 20 Jun 2012 22:37:20 +0200
Subject: [Buildroot] [git commit] qt: remove redundant and incorrect URL
	from Makefile
Message-ID: <20120620210019.779938572C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f703569bead266c1a35f05191d9e4ae8992e8dbd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The upstream URL for Buildroot packages is usually visible in the Config.in
file, not in comments in the Makefile.

Moreover, this URL does not point to the correct upstream project.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt/qt.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index b751696..ff9f4ca 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -1,7 +1,6 @@
 ######################################################################
 #
 # Qt Embedded for Linux
-# http://www.qtsoftware.com/
 #
 # This makefile was originally composed by Thomas Lundquist <thomasez@zelow.no>
 # Later heavily modified by buildroot developers
