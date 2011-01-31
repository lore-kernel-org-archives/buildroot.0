From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 31 Jan 2011 21:30:05 +0100
Subject: [Buildroot] [git commit master 1/1] CHANGES: #1681,
	#2839 and #2893 are resolved
Message-ID: <20110131203037.423D58E2CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6d17192f27f1d035edcc8b90db05be10a0fe86fe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index 79197de..25c3163 100644
--- a/CHANGES
+++ b/CHANGES
@@ -67,9 +67,12 @@
 
 	#561:  ltp-testsuite failed to install
 	#1651: Build fail caused by ccache in module-init-tools
+	#1681: Cross-compiled binaries shouldn't be installed into staging
 	#1735: [PATCH] mplayer: convert to autotools infrastructure
 	#2647: makedevs package lacks support for 16-bit major/minor numbers
 	#2371: QT MYSQL Module does not build when MySQL installed on the host
+	#2839: compile fails in various packages with a odd message "error:...
+	#2893: Broken "make source" with external toolchain
 	#2905: Qt: Speed up compilation, if gui-module isn't selected
 	#2929: genext2fs: couldn't allocate a block (no free space)
 	#2965: Broken linkage to xkbcomp (blocking X server startup)
-- 
1.7.3.4
