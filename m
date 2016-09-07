From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 7 Sep 2016 22:46:14 +0200
Subject: [Buildroot] [git commit] pugixml: add toolchain comment
Message-ID: <20160907204651.9BFFF8225B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ada5d835011b335ad2cb3c4f6d50e185cc0973cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reported-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pugixml/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/pugixml/Config.in b/package/pugixml/Config.in
index 5310b10..d67e695 100644
--- a/package/pugixml/Config.in
+++ b/package/pugixml/Config.in
@@ -14,3 +14,6 @@ config BR2_PACKAGE_PUGIXML
 
 	  http://pugixml.org/
 	  https://github.com/zeux/pugixml
+
+comment "pugixml needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
