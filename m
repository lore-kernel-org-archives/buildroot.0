From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 22 Jan 2020 23:24:43 +0100
Subject: [Buildroot] [git commit] package/bridge-utils: add hash for license
 file
Message-ID: <20200122222120.7FEB883710@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b57dd94764b0ed0f1d0a4656aafe6f00bfb659ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/bridge-utils/bridge-utils.hash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/bridge-utils/bridge-utils.hash b/package/bridge-utils/bridge-utils.hash
index e699b24a63..5658116f88 100644
--- a/package/bridge-utils/bridge-utils.hash
+++ b/package/bridge-utils/bridge-utils.hash
@@ -1,2 +1,5 @@
 # From https://www.kernel.org/pub/linux/utils/net/bridge-utils/sha256sums.asc
 sha256 cc67efb5d5fb8928a6569b3fade2b4042ec17da04678dab127d96b46489e26c8 bridge-utils-1.6.tar.xz
+
+# locally computed
+sha256 995a31f60a9ddb4c609214cc7d17ca94cc3cbc7f37e1e64dba81e7f8ea9d4f91  COPYING
