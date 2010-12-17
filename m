From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 17 Dec 2010 17:00:18 +0100
Subject: [Buildroot] [git commit master 1/1] CHANGES: #561/#1651/#1735 are
	resolved
Message-ID: <20101217160155.3B9668E9A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f362c51f7fb0e7e70136804467557e23550b2e96
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index cfaf386..45d2830 100644
--- a/CHANGES
+++ b/CHANGES
@@ -19,6 +19,9 @@
 
 	Issues resolved (http://bugs.uclibc.org):
 
+	#561:  ltp-testsuite failed to install
+	#1651: Build fail caused by ccache in module-init-tools
+	#1735: [PATCH] mplayer: convert to autotools infrastructure
 	#2905: Qt: Speed up compilation, if gui-module isn't selected
 
 2010.11, Released November 30th, 2010:
-- 
1.7.2.2
