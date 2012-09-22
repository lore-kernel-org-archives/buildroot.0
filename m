From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 23:36:00 +0200
Subject: [Buildroot] [git commit] zeromq: bump version to 2.2.0
Message-ID: <20120922213625.DDB78996D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a018c076fb2b73784469ed484437087f6fd08ca5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/zeromq/zeromq.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index 99ee4ca..284a168 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-ZEROMQ_VERSION = 2.1.11
+ZEROMQ_VERSION = 2.2.0
 ZEROMQ_SITE = http://download.zeromq.org/
 ZEROMQ_INSTALL_STAGING = YES
 ZEROMQ_DEPENDENCIES = util-linux
