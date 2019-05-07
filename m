From: Peter Seiderer <ps.report@gmx.net>
Date: Tue,  7 May 2019 23:30:28 +0200
Subject: [Buildroot] [PATCH v1 26/28] package/turbolua: replace utf-8
 apostrophe by ascii single quote
In-Reply-To: <20190507213030.1542-1-ps.report@gmx.net>
References: <20190507213030.1542-1-ps.report@gmx.net>
Message-ID: <20190507213030.1542-6-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/turbolua/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/turbolua/Config.in b/package/turbolua/Config.in
index 34f66ef131..6e792ebba5 100644
--- a/package/turbolua/Config.in
+++ b/package/turbolua/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_TURBOLUA
 	  uses a event-driven, non-blocking, no thread design to deliver
 	  excellent performance and minimal footprint to high-load
 	  applications while also providing excellent support for
-	  embedded uses. The toolkit can be used for HTTP REST API?s,
+	  embedded uses. The toolkit can be used for HTTP REST API's,
 	  traditional dynamic web pages through templating, open
 	  connections like WebSockets, or just as high level building
 	  blocks for native speed network applications.
--
2.21.0
