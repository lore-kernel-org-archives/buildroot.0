From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Jan 2019 19:28:02 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/xerces: use new
 website (was redirecting)
Message-ID: <20190129182705.93D74814ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad78c7178b015c9e76f0b43817a470a8ad108ca1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 22c80d2a820f33ccfbaef3446d72a7650ebddf38)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xerces/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xerces/Config.in b/package/xerces/Config.in
index 8d55a5cbc2..2edc4346b5 100644
--- a/package/xerces/Config.in
+++ b/package/xerces/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_XERCES
 	help
 	  Xerces-C++ is a validating XML parser written in portable C++.
 
-	  http://xml.apache.org/xerces-c/
+	  http://xerces.apache.org/xerces-c/
 
 comment "xerces-c++ needs a toolchain w/ C++, wchar"
 	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR)
