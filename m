From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 May 2021 19:49:51 +0200
Subject: [Buildroot] [git commit] package/minidlna: add CPE variables
Message-ID: <20210523172850.9165788F9F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cb140cd04006eb2c27e478ce6ae2a379da79ee3b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:readymedia_project:readymedia is a valid CPE identifier for
this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Areadymedia_project%3Areadymedia

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/minidlna/minidlna.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
index 0bb3dd3502..86a2bb368d 100644
--- a/package/minidlna/minidlna.mk
+++ b/package/minidlna/minidlna.mk
@@ -8,6 +8,8 @@ MINIDLNA_VERSION = 1.3.0
 MINIDLNA_SITE = https://downloads.sourceforge.net/project/minidlna/minidlna/$(MINIDLNA_VERSION)
 MINIDLNA_LICENSE = GPL-2.0, BSD-3-Clause
 MINIDLNA_LICENSE_FILES = COPYING LICENCE.miniupnpd
+MINIDLNA_CPE_ID_VENDOR = readymedia_project
+MINIDLNA_CPE_ID_PRODUCT = readymedia
 
 MINIDLNA_DEPENDENCIES = \
 	$(TARGET_NLS_DEPENDENCIES) \
