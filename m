From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 5 Feb 2013 14:53:11 +0100
Subject: [Buildroot] [git commit] gnutls: tools require the package
Message-ID: <20130205135352.ACB989A966@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1b2ab4a43c2090f6d2b9c6b96db5c9284783d329
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: remove the unneeded BR2_USE_WCHAR dependency]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gnutls/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gnutls/Config.in b/package/gnutls/Config.in
index 3a34c48..038b3fb 100644
--- a/package/gnutls/Config.in
+++ b/package/gnutls/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_GNUTLS
 
 config BR2_PACKAGE_GNUTLS_TOOLS
 	bool "install tools"
-	depends on BR2_USE_WCHAR
+	depends on BR2_PACKAGE_GNUTLS
 	help
 	  Install GnuTLS command line tools for various cryptographic tasks.
 
