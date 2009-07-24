From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 24 Jul 2009 15:51:51 +0200
Subject: [Buildroot] [git commit] TODO: remove outdated stuff
Message-ID: <20090724135214.DD1CE77800@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5d79f6caf0d62a3458c4911489d684ba13b52e95
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 TODO |    7 -------
 1 files changed, 0 insertions(+), 7 deletions(-)

diff --git a/TODO b/TODO
index 9b89c40..4de15ab 100644
--- a/TODO
+++ b/TODO
@@ -5,10 +5,3 @@ Buildroot2 TODOs
 - convert all packages that use autoconf to use the infrastructure of
   packages/Makefile.autotools.in
 - fix setting of flags for packages
-
-- stabilize for a 0.10.0 release
-
-- think about using a common --config-cache for configure
-  Should take care of expanding TARGET_CONFIGURE_ARGS for cross compiles
-  to working presets.
-
-- 
1.6.3.3
