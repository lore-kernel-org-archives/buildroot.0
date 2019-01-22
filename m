From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 22 Jan 2019 07:58:46 -0600
Subject: [Buildroot] [PATCH] package/xerces: use new website(was redirecting)
Message-ID: <1548165526-45785-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/xerces/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xerces/Config.in b/package/xerces/Config.in
index 8d55a5c..2edc434 100644
--- a/package/xerces/Config.in
+++ b/package/xerces/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_XERCES
 	help
 	  Xerces-C++ is a validating XML parser written in portable C++.
 
-	  http://xml.apache.org/xerces-c/
+	  http://xerces.apache.org/xerces-c/
 
 comment "xerces-c++ needs a toolchain w/ C++, wchar"
 	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR)
-- 
1.9.1
