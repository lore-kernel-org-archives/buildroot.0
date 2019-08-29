From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Aug 2019 23:05:42 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/Config.in: remove
 double /
Message-ID: <20190829210150.97ED588505@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e4cfbba2388c7999705cd00539c4d0cbec45f64a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Detected by check-package, which gets confused by it.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 651524db3ac35fea98572eab4b950bac23b4ef26)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Config.in b/package/Config.in
index f592e74a99..cc5dd769a5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1057,7 +1057,7 @@ menu "External python modules"
 	source "package/python-slob/Config.in"
 	source "package/python-smbus-cffi/Config.in"
 	source "package/python-socketio/Config.in"
-	source "package/python-sortedcontainers//Config.in"
+	source "package/python-sortedcontainers/Config.in"
 	source "package/python-spidev/Config.in"
 	source "package/python-sqlalchemy/Config.in"
 	source "package/python-subprocess32/Config.in"
