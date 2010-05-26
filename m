From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 26 May 2010 14:14:39 +0200
Subject: [Buildroot] [git commit master] enchant: add comment about needing
	C++ support in toolchain
Message-ID: <20100526122000.C54B31EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ab607f658e33b8c13fb805285dc100954bd7c9a4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/enchant/Config.in |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/enchant/Config.in b/package/enchant/Config.in
index e65d681..9cd15a1 100644
--- a/package/enchant/Config.in
+++ b/package/enchant/Config.in
@@ -7,3 +7,6 @@ config BR2_PACKAGE_ENCHANT
 	  API across a number of spell-checking system backends.
 
 	  http://www.abisource.com/projects/enchant/
+
+comment "enchant requires a toolchain with C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP
-- 
1.6.3.3
