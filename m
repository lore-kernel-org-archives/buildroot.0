From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 Dec 2019 22:09:36 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/opentyrian-data:
 update the upstream URL in Config.in
Message-ID: <20191205210734.45176880A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e1cf3f98d1691ca593a50b8d11ba04c798011698
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(405)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f06ae71f64642b5ebdb17f02a57d69cf846543a2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opentyrian-data/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/opentyrian-data/Config.in b/package/opentyrian-data/Config.in
index dd3b0c1328..c0698c297c 100644
--- a/package/opentyrian-data/Config.in
+++ b/package/opentyrian-data/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_OPENTYRIAN_DATA
 	  original Tyrian 2.1 data files, that have been released as
 	  Freeware in 2004, are compatible.
 
-	  http://code.google.com/p/opentyrian/wiki/FAQ
+	  https://bitbucket.org/opentyrian/opentyrian/wiki/Home
