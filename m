From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Jun 2015 23:52:45 +0200
Subject: [Buildroot] [git commit] Kickoff 2015.08 cycle
Message-ID: <20150601220249.3CEB281D62@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=841d3ac7e04fe3c2d8f4ccbc063db5650ec4779e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index e490871..43b5ba5 100644
--- a/Makefile
+++ b/Makefile
@@ -28,7 +28,7 @@
 all:
 
 # Set and export the version string
-export BR2_VERSION := 2015.05
+export BR2_VERSION := 2015.08-git
 
 # Check for minimal make version (note: this check will break at make 10.x)
 MIN_MAKE_VERSION = 3.81
