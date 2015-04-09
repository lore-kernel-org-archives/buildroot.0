From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Apr 2015 23:30:48 +0200
Subject: [Buildroot] [git commit] boost: fix indentation in Config.in
Message-ID: <20150409213109.5782280458@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a9ebeb48564982b82e749e055c67a29f3dbef5a0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replace spaces by one tab in the Config.in option for boost-log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/boost/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index a004fd8..65bf605 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -88,7 +88,7 @@ comment "boost-locale needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
 
 config BR2_PACKAGE_BOOST_LOG
-        bool "boost-log"
+	bool "boost-log"
 
 config BR2_PACKAGE_BOOST_MATH
 	bool "boost-math"
