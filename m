From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Apr 2017 20:04:43 +0200
Subject: [Buildroot] [git commit] freetype: legal-info: include
	docs/LICENSE.TXT
Message-ID: <20170407180520.021EC826E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2843b970e749db28eb06d0c5968a60bc006c9747
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LICENSE.TXT gives an overview and explains in detail that freetype is dual
licensed under the FTL and GPLv2+, so also include it in the license files.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freetype/freetype.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index da9e900..57f9b20 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -10,7 +10,7 @@ FREETYPE_SITE = http://download.savannah.gnu.org/releases/freetype
 FREETYPE_INSTALL_STAGING = YES
 FREETYPE_MAKE_OPTS = CCexe="$(HOSTCC)"
 FREETYPE_LICENSE = Dual FTL/GPL-2.0+
-FREETYPE_LICENSE_FILES = docs/FTL.TXT docs/GPLv2.TXT
+FREETYPE_LICENSE_FILES = docs/LICENSE.TXT docs/FTL.TXT docs/GPLv2.TXT
 FREETYPE_DEPENDENCIES = host-pkgconf
 FREETYPE_CONFIG_SCRIPTS = freetype-config
 
