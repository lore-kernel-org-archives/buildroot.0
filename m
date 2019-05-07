From: Peter Seiderer <ps.report@gmx.net>
Date: Tue,  7 May 2019 22:35:30 +0200
Subject: [Buildroot] [PATCH v1 10/28] package/capnproto: replace utf-8
 apostrophe by ascii single quote
In-Reply-To: <20190507203548.10337-1-ps.report@gmx.net>
References: <20190507203548.10337-1-ps.report@gmx.net>
Message-ID: <20190507203548.10337-10-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
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
-	  fact, in benchmarks, Cap?n Proto is INFINITY TIMES
+	  fact, in benchmarks, Cap'n Proto is INFINITY TIMES
 	  faster than Protocol Buffers.

 	  https://capnproto.org/index.html
--
2.21.0
