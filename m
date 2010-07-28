From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 28 Jul 2010 16:27:09 +0200
Subject: [Buildroot] [git commit master 1/1] CHANGES: add note about GTK+ on
	directfb being deprecated
Message-ID: <20100728152235.8A9BE8345A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=13a10a095949e4304f19ea3d5a78b2f3ce2bd6b6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index 2b5aab6..d4d70a6 100644
--- a/CHANGES
+++ b/CHANGES
@@ -16,6 +16,9 @@
 	development cycle.
 
 	Alpha, IA64 and Sparc64 architectures marked as deprecated.
+	GTK+ on DirectFB has also been marked as deprecated, as it is
+	not supported in recent GTK+ versions, and more and more
+	packages depends on the new versions.
 	Unless someone steps up to support them, they will be removed
 	during the 2010.11 development cycle.
 
-- 
1.7.1
