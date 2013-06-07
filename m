From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 7 Jun 2013 09:32:28 +0200
Subject: [Buildroot] [git commit] manual: correct error in github tarball
	information
Message-ID: <20130607085237.455A49A9DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=484b6dd8a3abccf0be34d1bed3761a8809ba23be
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updates to manual for bug 6302

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/manual/adding-packages-tips.txt |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/docs/manual/adding-packages-tips.txt b/docs/manual/adding-packages-tips.txt
index 21e520b..f435add 100644
--- a/docs/manual/adding-packages-tips.txt
+++ b/docs/manual/adding-packages-tips.txt
@@ -58,7 +58,7 @@ enough):
 
 ------------------------
 FOO_VERSION = 1234567
-FOO_SITE = http://github.com/<user>/<package>/tarball/<branch>
+FOO_SITE = http://github.com/<user>/<package>/tarball/$(FOO_VERSION)
 ------------------------
 
 Note that the name of the tarball is the default +foo-1234567.tar.gz+
