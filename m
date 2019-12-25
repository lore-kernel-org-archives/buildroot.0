From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Dec 2019 19:04:12 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/tcllib: update
 the upstream URL in Config.in
Message-ID: <20191225175548.1F4B68E394@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1df28c980b161f06b109b7c83ee7b9a0dc9dfc5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(Err)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 556fb0d6b6a52abaca508a8b80d79954134bc4b6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tcllib/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tcllib/Config.in b/package/tcllib/Config.in
index b0a4ad060e..3a307b9aee 100644
--- a/package/tcllib/Config.in
+++ b/package/tcllib/Config.in
@@ -8,4 +8,4 @@ config BR2_PACKAGE_TCLLIB
 	  is to collect commonly used function into a single library,
 	  which users can rely on to be available and stable
 
-	  http://tcl.activestate.com/software/tcllib/
+	  https://www.tcl.tk/software/tcllib/
