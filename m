From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 5 Jul 2017 13:14:34 +0200
Subject: [Buildroot] [PATCH v4 17/36] lttng-tools: remove host/usr reference
	from help text
In-Reply-To: <20170705111453.2284-1-arnout@mind.be>
References: <20170705111453.2284-1-arnout@mind.be>
Message-ID: <20170705111453.2284-18-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/lttng-tools/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lttng-tools/Config.in b/package/lttng-tools/Config.in
index 187e424b0b..9c86cc2646 100644
--- a/package/lttng-tools/Config.in
+++ b/package/lttng-tools/Config.in
@@ -17,7 +17,7 @@ config BR2_PACKAGE_LTTNG_TOOLS
 	  and stop tracing sessions. Analysis of the trace can be done
 	  on the host machine using the babeltrace utility. This
 	  utility is automatically built by Buildroot in
-	  $(O)/host/usr/bin/babeltrace, as a dependency of
+	  $(O)/host/bin/babeltrace, as a dependency of
 	  lttng-tools. However, there is also a lttng-babeltrace
 	  package for the target, if babeltrace on the target is
 	  interesting.
-- 
2.13.2
