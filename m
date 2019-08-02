From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 2 Aug 2019 18:43:57 +0200
Subject: [Buildroot] [git commit] package/Config.in: remove double /
Message-ID: <20190802164122.4F8DD8CA23@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=651524db3ac35fea98572eab4b950bac23b4ef26
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Detected by check-package, which gets confused by it.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Config.in b/package/Config.in
index b7472b9bea..35e71e3185 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1069,7 +1069,7 @@ menu "External python modules"
 	source "package/python-slob/Config.in"
 	source "package/python-smbus-cffi/Config.in"
 	source "package/python-socketio/Config.in"
-	source "package/python-sortedcontainers//Config.in"
+	source "package/python-sortedcontainers/Config.in"
 	source "package/python-spidev/Config.in"
 	source "package/python-sqlalchemy/Config.in"
 	source "package/python-subprocess32/Config.in"
