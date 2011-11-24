From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 24 Nov 2011 23:03:57 +0100
Subject: [Buildroot] [git commit] CHANGES: update with recent changes
Message-ID: <20111124221421.CFF818F617@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0ff53f128d865dacfd7a46a5ee9e36c2f28cd89f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index bb6bae9..289a6b2 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,14 @@
+2011.11, Not released yet:
+
+	Fixes all over the tree.
+
+	Toolchain: Fix gdb dependencies for external toolchains,
+	adjust uClibc patches so they don't confuse modern versions of
+	patch, bump crosstool-ng, kernel headers and linux versions.
+
+	Updated/fixed packages: busybox, freetype, mplayer, opencv,
+	rsyslog, xapp_xf86dga
+
 2011.11-rc2, Released November 18th, 2011:
 
 	Fixes all over the tree and new features.
