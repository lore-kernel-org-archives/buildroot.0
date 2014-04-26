From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 26 Apr 2014 11:38:04 +0200
Subject: [Buildroot] [git commit] czmq: bump version to v2.2.0
Message-ID: <20140426093817.4175E9C9C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=75a8d8aca5241d740df49669ff264c9a8baf3aa3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/czmq/czmq.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/czmq/czmq.mk b/package/czmq/czmq.mk
index db8f727..4703041 100644
--- a/package/czmq/czmq.mk
+++ b/package/czmq/czmq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CZMQ_VERSION = b5730c5f8290a611fd3b92e4a259c2b0ed96cb73
+CZMQ_VERSION = v2.2.0
 CZMQ_SITE = git://github.com/zeromq/czmq.git
 
 # Autoreconf required as we use the git tree
