From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 24 Jul 2017 22:14:42 +0200
Subject: [Buildroot] [PATCH v1 2/2] orc: update project url
In-Reply-To: <20170724201442.6500-1-ps.report@gmx.net>
References: <20170724201442.6500-1-ps.report@gmx.net>
Message-ID: <20170724201442.6500-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The original url http://code.entropywave.com/orc is dead (server not found).

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/orc/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/orc/Config.in b/package/orc/Config.in
index 2470d99284..7943ecfbfb 100644
--- a/package/orc/Config.in
+++ b/package/orc/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_ORC
 	  Orc is a library and set of tools for compiling and executing
 	  very simple programs that operate on arrays of data.
 
-	  http://code.entropywave.com/projects/orc/
+	  https://gstreamer.freedesktop.org/projects/orc.html
 
 comment "orc needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.11.0
