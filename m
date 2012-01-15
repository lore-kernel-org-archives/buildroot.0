From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 15 Jan 2012 20:47:58 +0100
Subject: [Buildroot] [git commit] Fix typo buiding -> building
Message-ID: <20120116093410.4B94E90356@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8f8d414b61bf3b27a77ad38dfc493ae412b65471
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-common.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 56ac85f..fb87a88 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -105,4 +105,4 @@ config BR2_TARGET_OPTIMIZATION
 config BR2_TARGET_LDFLAGS
 	string "Target linker options"
 	help
-	  Extra options to pass to the linker when buiding for the target.
+	  Extra options to pass to the linker when building for the target.
