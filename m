From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 14:58:59 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/c-periphery: add
 _CPE_ID_VENDOR
Message-ID: <20210426125912.76D007FC74@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8184b0f4691628a5951eb305b307a99d823b6c34
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:c-periphery_project:c-periphery:* is a valid CPE identifier for this package:

 https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:c-periphery_project:c-periphery

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit fc6a829abe4c167bfb7f66465da6255e3938af13)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/c-periphery/c-periphery.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/c-periphery/c-periphery.mk b/package/c-periphery/c-periphery.mk
index dcc82f19c0..722679f9f8 100644
--- a/package/c-periphery/c-periphery.mk
+++ b/package/c-periphery/c-periphery.mk
@@ -9,5 +9,6 @@ C_PERIPHERY_SITE = $(call github,vsergeev,c-periphery,v$(C_PERIPHERY_VERSION))
 C_PERIPHERY_INSTALL_STAGING = YES
 C_PERIPHERY_LICENSE = MIT
 C_PERIPHERY_LICENSE_FILES = LICENSE
+C_PERIPHERY_CPE_ID_VENDOR = c-periphery_project
 
 $(eval $(cmake-package))
