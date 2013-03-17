From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 17 Mar 2013 16:00:36 +0100
Subject: [Buildroot] [git commit] zeromq: bump version to 3.2.2
Message-ID: <20130317150006.7C3E09B135@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3cc2cdb72fde97e211c42f67dc7973e051f95494
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Alexander Lukichev <alexander.lukichev@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/zeromq/zeromq.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index 284a168..2d0026d 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-ZEROMQ_VERSION = 2.2.0
+ZEROMQ_VERSION = 3.2.2
 ZEROMQ_SITE = http://download.zeromq.org/
 ZEROMQ_INSTALL_STAGING = YES
 ZEROMQ_DEPENDENCIES = util-linux
