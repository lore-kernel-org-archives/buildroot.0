From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 6 Sep 2015 11:41:36 +0200
Subject: [Buildroot] [git commit] dos2unix: update homepage link
Message-ID: <20150906094215.097B481971@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dd7bac42c201a14b844d1ef99e55c0ef2c33ddcb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use the maintainer page that is much more informative than freecode.com.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dos2unix/Config.in      |    2 +-
 package/dos2unix/Config.in.host |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dos2unix/Config.in b/package/dos2unix/Config.in
index 782c25c..ead1a8f 100644
--- a/package/dos2unix/Config.in
+++ b/package/dos2unix/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_DOS2UNIX
 	help
 	  dos2unix converts text file line endings between CRLF and LF
 
-	  http://freshmeat.net/projects/dos2unix
+	  http://waterlan.home.xs4all.nl/dos2unix.html
diff --git a/package/dos2unix/Config.in.host b/package/dos2unix/Config.in.host
index 012d614..5ec6033 100644
--- a/package/dos2unix/Config.in.host
+++ b/package/dos2unix/Config.in.host
@@ -3,4 +3,4 @@ config BR2_PACKAGE_HOST_DOS2UNIX
 	help
 	  dos2unix converts text file line endings between CRLF and LF
 
-	  http://freecode.com/projects/dos2unix
+	  http://waterlan.home.xs4all.nl/dos2unix.html
