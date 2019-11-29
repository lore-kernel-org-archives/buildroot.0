From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Nov 2019 10:10:48 +0100
Subject: [Buildroot] [git commit] package/libsecret: update the upstream URL
 in Config.in
Message-ID: <20191129090526.4B81A80418@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=68130a53e8305b1f4d6ab96e7c6ca6c46ae0c69e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(404)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
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
