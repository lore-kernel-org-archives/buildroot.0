From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri,  2 Aug 2019 10:29:35 +0200
Subject: [Buildroot] [PATCH 2/2] package/Config.in: remove double /
In-Reply-To: <20190802082935.26747-1-arnout@mind.be>
References: <20190802082935.26747-1-arnout@mind.be>
Message-ID: <20190802082935.26747-2-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
-- 
2.21.0
