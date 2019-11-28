From: Mark Corbin <mark@dibsco.co.uk>
Date: Thu, 28 Nov 2019 13:01:09 +0000
Subject: [Buildroot] [PATCH 1/1] package/libsecret: update the upstream URL
 in Config.in
Message-ID: <20191128130109.4213-1-mark@dibsco.co.uk>
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
-- 
2.20.1
