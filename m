From: Mark Corbin <mark@dibsco.co.uk>
Date: Tue, 26 Nov 2019 15:00:28 +0000
Subject: [Buildroot] [PATCH 1/1] package/fmt: add an upstream URL to
 Config.in
Message-ID: <20191126150028.28743-1-mark@dibsco.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add an upstream URL to the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
---
 package/fmt/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/fmt/Config.in b/package/fmt/Config.in
index 69a6fb80a6..1251ace2b2 100644
--- a/package/fmt/Config.in
+++ b/package/fmt/Config.in
@@ -7,5 +7,7 @@ config BR2_PACKAGE_FMT
 	  used as a safe alternative to printf or as a fast alternative
 	  to IOStreams.
 
+	  https://fmt.dev/latest/index.html
+
 comment "fmt needs a toolchain w/ C++, wchar"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
-- 
2.20.1
