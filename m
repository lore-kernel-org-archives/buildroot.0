From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Nov 2014 23:47:24 +0100
Subject: [Buildroot] [git commit] speex: use BR2_ARM_CPU_ARM* options
Message-ID: <20141106233446.8AE32B12A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e4d04e539e751dd1e3dcf7051d970ba912269271
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/speex/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/speex/Config.in b/package/speex/Config.in
index ab743fe..f18e866 100644
--- a/package/speex/Config.in
+++ b/package/speex/Config.in
@@ -13,7 +13,7 @@ if BR2_PACKAGE_SPEEX
 config BR2_PACKAGE_SPEEX_ARM4
 	bool
 	default y
-	depends on BR2_arm920t || BR2_arm922t || BR2_strongarm || BR2_fa526
+	depends on BR2_ARM_CPU_ARMV4
 
 config BR2_PACKAGE_SPEEX_ARM5E
 	default y
