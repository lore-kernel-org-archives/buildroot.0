From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Jun 2018 22:08:45 +0200
Subject: [Buildroot] [git commit] package/powerpc-utils: Add sha256 hash for
 the COPYING file
Message-ID: <20180619201601.5F65789075@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4a7bf483d82af69ab14569ca6b49238d03e8c140
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Suggested-by: Peter Korsgaard <peter@korsgaard.com>
CC: Joel Stanley <joel@jms.id.au>
Signed-off-by: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/powerpc-utils/powerpc-utils.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/powerpc-utils/powerpc-utils.hash b/package/powerpc-utils/powerpc-utils.hash
index 0c495d55e9..b493be086b 100644
--- a/package/powerpc-utils/powerpc-utils.hash
+++ b/package/powerpc-utils/powerpc-utils.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256 77efe3978ac9c251c4728a35b9aebd6076583939a8e26cc7f07ffa86432a8bf0 powerpc-utils-v1.3.5.tar.gz
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 COPYING
