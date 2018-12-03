From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Dec 2018 21:24:21 +0100
Subject: [Buildroot] [git commit] package/docker-cli: fix comment header
Message-ID: <20181203202102.6809F8A570@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b8941627371983ba7b74de9c540099ae9027ae18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following check-package warning:

package/docker-cli/docker-cli.mk:1: should be 80 hashes (http://nightly.buildroot.org/#writing-rules-mk)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/docker-cli/docker-cli.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index bb8ce41bf1..c73caa2652 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -1,4 +1,4 @@
-###############################################################################
+################################################################################
 #
 # docker-cli
 #
