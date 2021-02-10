From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Feb 2021 20:01:41 +0100
Subject: [Buildroot] [git commit] package/upx: set UPX_CPE_ID_VALID
Message-ID: <20210210184152.7128A83976@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=69ef423d66140a99df5043efe537bc2c628a0bef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:upx_project:upx is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aupx_project%3Aupx

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/upx/upx.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/upx/upx.mk b/package/upx/upx.mk
index c577dfc2df..2449fa643b 100644
--- a/package/upx/upx.mk
+++ b/package/upx/upx.mk
@@ -9,6 +9,7 @@ UPX_SITE = https://github.com/upx/upx/releases/download/v$(UPX_VERSION)
 UPX_SOURCE = upx-$(UPX_VERSION)-src.tar.xz
 UPX_LICENSE = GPL-2.0+
 UPX_LICENSE_FILES = COPYING
+UPX_CPE_ID_VALID = YES
 
 HOST_UPX_DEPENDENCIES = host-ucl host-zlib
 
