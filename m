From: Mark Corbin <mark@dibsco.co.uk>
Date: Tue, 17 Dec 2019 12:25:06 +0000
Subject: [Buildroot] [PATCH 1/1] package/pimd: update the upstream URL in
 Config.in
Message-ID: <20191217122506.15746-1-mark@dibsco.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(404)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
---
 package/pimd/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pimd/Config.in b/package/pimd/Config.in
index d6a579bda2..718f84f4f8 100644
--- a/package/pimd/Config.in
+++ b/package/pimd/Config.in
@@ -5,4 +5,4 @@ config BR2_PACKAGE_PIMD
 	  pimd is a lightweight stand-alone PIM-SM v2 multicast routing
 	  daemon.
 
-	  http://troglobit.com/project/pimd/
+	  http://troglobit.com/projects/pimd/
-- 
2.20.1
