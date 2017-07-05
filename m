From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 16:06:31 +0200
Subject: [Buildroot] [git commit] lttng-tools: remove host/usr reference
	from help text
Message-ID: <20170705141336.23C267FB34@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eb3f65801ff032c86e2437217effa4110f42b81f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lttng-tools/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lttng-tools/Config.in b/package/lttng-tools/Config.in
index 187e424..9c86cc2 100644
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
