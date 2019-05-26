From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 May 2019 09:24:44 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/capnproto:
 replace utf-8 apostrophe by ascii single quote
Message-ID: <20190526072357.AE1BE8E14E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c36b38f72ac9d647156e2440ab2067109060f524
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2a725944484e4783e21282c13902d74d7d2c48ac)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/capnproto/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/capnproto/Config.in b/package/capnproto/Config.in
index 00328fa6ce..a979a334ff 100644
--- a/package/capnproto/Config.in
+++ b/package/capnproto/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_CAPNPROTO
 	  Cap'n Proto is an insanely fast data interchange format
 	  and capability-based RPC system. Think JSON, except
 	  binary. Or think Protocol Buffers, except faster. In
-	  fact, in benchmarks, Cap???n Proto is INFINITY TIMES
+	  fact, in benchmarks, Cap'n Proto is INFINITY TIMES
 	  faster than Protocol Buffers.
 
 	  https://capnproto.org/index.html
