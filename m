From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Nov 2019 16:44:59 +0100
Subject: [Buildroot] [git commit] package/libass: update the upstream URL in
 Config.in
Message-ID: <20191128154138.29566810D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e3e69be0075558830f67489a2b52b2d0ff982435
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(405)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libass/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libass/Config.in b/package/libass/Config.in
index 7690685187..c654d8212a 100644
--- a/package/libass/Config.in
+++ b/package/libass/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_LIBASS
 	  libass is a portable subtitle renderer for the ASS/SSA
 	  (Advanced Substation Alpha/Substation Alpha) subtitle format
 
-	  http://code.google.com/p/libass/
+	  https://github.com/libass/libass
