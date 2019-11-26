From: Mark Corbin <mark@dibsco.co.uk>
Date: Tue, 26 Nov 2019 13:55:13 +0000
Subject: [Buildroot] [PATCH 1/1] package/faifa: update the upstream URL in
 Config.in
Message-ID: <20191126135513.22736-1-mark@dibsco.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(Err)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
---
 package/faifa/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/faifa/Config.in b/package/faifa/Config.in
index 753abc67ec..486f35d508 100644
--- a/package/faifa/Config.in
+++ b/package/faifa/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_FAIFA
 	  Intellon-specific management and control frames as well as
 	  standard management frames.
 
-	  https://dev.open-plc.org
+	  https://github.com/ffainelli/faifa
 
 comment "faifa needs a toolchain w/ dynamic library, threads"
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.20.1
