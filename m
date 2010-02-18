From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 18 Feb 2010 11:57:37 +0100
Subject: [Buildroot] [git commit master] at91sam9260pf_defconfig: use
	standard download dir location
Message-ID: <20100218110142.2A14C77683@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=68d2f4564eaeb7770dbc0fe3f1ddf09833765550
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Based on patch by Roo <roo.watt@gmail.com>

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/at91sam9260pf_defconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/configs/at91sam9260pf_defconfig b/configs/at91sam9260pf_defconfig
index c668e03..de513a6 100644
--- a/configs/at91sam9260pf_defconfig
+++ b/configs/at91sam9260pf_defconfig
@@ -58,7 +58,7 @@ BR2_SVN="svn co"
 BR2_ZCAT="gzip -d -c"
 BR2_BZCAT="bzcat"
 BR2_TAR_OPTIONS=""
-BR2_DL_DIR="/usr/local/install/downloads"
+BR2_DL_DIR="$(TOPDIR)/dl"
 
 #
 # Mirrors and Download locations
-- 
1.6.3.3
