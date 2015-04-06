From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Apr 2015 11:07:37 +0200
Subject: [Buildroot] [git commit] Makefile: remove dubious comment
Message-ID: <20150406093206.BA3AE800FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cb686165d22ecb6d1f7094a02ee6360c8b2ce92f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This comment is a left-over from previous code changes, and it doesn't
make much sense where it is placed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 Makefile |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 8d09725..65b60c2 100644
--- a/Makefile
+++ b/Makefile
@@ -376,9 +376,6 @@ endif
 include package/Makefile.in
 include support/dependencies/dependencies.mk
 
-# We also need the various per-package makefiles, which also add
-# each selected package to TARGETS if that package was selected
-# in the .config file.
 include toolchain/*.mk
 include toolchain/*/*.mk
 
