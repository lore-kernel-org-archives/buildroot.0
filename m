From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Sep 2020 22:37:22 +0200
Subject: [Buildroot] [git commit] package/enchant: bump to version 2.2.11
Message-ID: <20200921202821.B5CFF7FF2B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2657782db50a672e8c1c4d20d2edfcf2a020d659
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/enchant/enchant.hash | 2 +-
 package/enchant/enchant.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/enchant/enchant.hash b/package/enchant/enchant.hash
index 5485444519..84d738ffa6 100644
--- a/package/enchant/enchant.hash
+++ b/package/enchant/enchant.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  c7b5e2853f0dd0b1aafea2f9e071941affeec3a76df8e3f6d67a718c89293555  enchant-2.2.8.tar.gz
+sha256  a29c5777c4e45fcac2595c15c49d6d2aa434fa5e7c993dff3f9f367b65fe472a  enchant-2.2.11.tar.gz
 sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING.LIB
diff --git a/package/enchant/enchant.mk b/package/enchant/enchant.mk
index 4465b38885..c342600bd8 100644
--- a/package/enchant/enchant.mk
+++ b/package/enchant/enchant.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ENCHANT_VERSION = 2.2.8
+ENCHANT_VERSION = 2.2.11
 ENCHANT_SITE = \
 	https://github.com/AbiWord/enchant/releases/download/v$(ENCHANT_VERSION)
 ENCHANT_INSTALL_STAGING = YES
