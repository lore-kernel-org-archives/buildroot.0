From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Dec 2018 15:17:52 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/docker-cli: fix
 comment header
Message-ID: <20181216142219.47DB580174@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=109b966d0e46b51940726897892587f414af7e25
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

Fixes the following check-package warning:

package/docker-cli/docker-cli.mk:1: should be 80 hashes (http://nightly.buildroot.org/#writing-rules-mk)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b8941627371983ba7b74de9c540099ae9027ae18)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
