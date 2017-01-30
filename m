From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Jan 2017 22:06:49 +0100
Subject: [Buildroot] [PATCH] log4cxx: update upstream URL
Message-ID: <20170130210649.22110-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

apache.linux-mirror.org now return NXDOMAIN, so use logging.apache.org
instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/log4cxx/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/log4cxx/Config.in b/package/log4cxx/Config.in
index 40c7df922..6ec67b62e 100644
--- a/package/log4cxx/Config.in
+++ b/package/log4cxx/Config.in
@@ -11,7 +11,7 @@ config BR2_PACKAGE_LOG4CXX
 	  Apache log4cxx is a logging framework for C++ patterned
 	  after Apache log4j.
 
-	  http://apache.linux-mirror.org/logging/log4cxx/0.10.0
+	  https://logging.apache.org/log4cxx/
 
 comment "log4cxx needs a toolchain w/ C++, threads, dynamic library"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-- 
2.11.0
