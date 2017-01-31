From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 31 Jan 2017 10:25:07 +0100
Subject: [Buildroot] [git commit] log4cxx: update upstream URL
Message-ID: <20170131092527.023C7820FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d952d529284ed046f6d467a145235a6e0be58000
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

apache.linux-mirror.org now return NXDOMAIN, so use logging.apache.org
instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/log4cxx/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/log4cxx/Config.in b/package/log4cxx/Config.in
index 40c7df9..6ec67b6 100644
--- a/package/log4cxx/Config.in
+++ b/package/log4cxx/Config.in
@@ -11,7 +11,7 @@ config BR2_PACKAGE_LOG4CXX
 	  Apache log4cxx is a logging framework for C++ patterned
 	  after Apache log4j.
 
-	  http://apache.linux-mirror.org/logging/log4cxx/0.10.0
+	  https://logging.apache.org/log4cxx/
 
 comment "log4cxx needs a toolchain w/ C++, threads, dynamic library"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
