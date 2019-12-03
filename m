From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Dec 2019 17:37:51 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/libsecret: update
 the upstream URL in Config.in
Message-ID: <20191203163034.E461686BF9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=261ee89e2e4cf17640aad1c80ff77d14c4fd3462
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(404)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 68130a53e8305b1f4d6ab96e7c6ca6c46ae0c69e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libsecret/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libsecret/Config.in b/package/libsecret/Config.in
index 0539e5da2c..04a3e46fe7 100644
--- a/package/libsecret/Config.in
+++ b/package/libsecret/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_LIBSECRET
 	  using DBus. gnome-keyring and ksecretservice are both
 	  implementations of a Secret Service.
 
-	  https://wiki.gnome.org/Libsecret
+	  https://wiki.gnome.org/Projects/Libsecret
 
 comment "libsecret needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
