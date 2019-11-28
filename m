From: Mark Corbin <mark@dibsco.co.uk>
Date: Thu, 28 Nov 2019 14:14:05 +0000
Subject: [Buildroot] [PATCH 1/1] package/linux-fusion: add an upstream URL
 to Config.in
Message-ID: <20191128141405.9010-1-mark@dibsco.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add an upstream URL to the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
---
 package/linux-fusion/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/linux-fusion/Config.in b/package/linux-fusion/Config.in
index ed8bd6ad48..14b4f946af 100644
--- a/package/linux-fusion/Config.in
+++ b/package/linux-fusion/Config.in
@@ -8,3 +8,5 @@ config BR2_PACKAGE_LINUX_FUSION
 	help
 	  DirectFB Communication Layer allowing multiple DirectFB
 	  applications to run concurrently
+
+	  https://github.com/deniskropp/linux-fusion
-- 
2.20.1
