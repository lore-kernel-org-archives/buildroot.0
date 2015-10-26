From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Oct 2015 12:24:24 +0100
Subject: [Buildroot] [git commit] uboot-tools: fix hash for 2015.10 version
Message-ID: <20151026112430.3492080E59@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ea9a5c9f46d6333439bbd4f2a34574dbab30ff24
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes: http://autobuild.buildroot.net/results/c452507b1619fdc3fbde014f6b0bda5965a4b93d/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uboot-tools/uboot-tools.hash |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/uboot-tools/uboot-tools.hash b/package/uboot-tools/uboot-tools.hash
index 3b687d5..65a5261 100644
--- a/package/uboot-tools/uboot-tools.hash
+++ b/package/uboot-tools/uboot-tools.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256	0b48c9bd717f2c322ef791f8282e14c88be942dc7d1226df7e31a812a3af94d9  u-boot-2015.07.tar.bz2
+sha256	bdc68d5f9455ad933b059c735d983f2c8b6b552dafb062e5ff1444f623021955  u-boot-2015.10.tar.bz2
