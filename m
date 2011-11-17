From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 17 Nov 2011 23:56:44 +0100
Subject: [Buildroot] [git commit] CHANGES: #3355 is resolved
Message-ID: <20111117225825.11E298F5C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2b8643f0a4ca50af0cd5f456c66caffe320847ce
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Got fixed by fd38100e (mplayer: fix build on i386).

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index 6435f99..5021bd3 100644
--- a/CHANGES
+++ b/CHANGES
@@ -12,6 +12,7 @@
 
 	Issues resolved (http://bugs.uclibc.org):
 
+	#3355: mplayer fails to build
 	#4021: uClibc: undefined reference to `__GI___errno_location'
 
 2011.11-rc1, Released November 11th, 2011:
