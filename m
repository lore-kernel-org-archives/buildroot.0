From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Jan 2014 20:47:06 +0100
Subject: [Buildroot] [git commit] czmq: bump git snapshot
Message-ID: <20140103194751.7356C9C381@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2d1ff9fc835ee399898d4ff21ca9898e476f4874
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/czmq/czmq.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/czmq/czmq.mk b/package/czmq/czmq.mk
index da68790..db8f727 100644
--- a/package/czmq/czmq.mk
+++ b/package/czmq/czmq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CZMQ_VERSION = cb9839cf90e4ac69acb7c6ff2b4e2d42d704cf6e
+CZMQ_VERSION = b5730c5f8290a611fd3b92e4a259c2b0ed96cb73
 CZMQ_SITE = git://github.com/zeromq/czmq.git
 
 # Autoreconf required as we use the git tree
