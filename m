From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Feb 2017 18:59:02 +0100
Subject: [Buildroot] [git commit] package/lightning: Fix GNU Mirror Path
Message-ID: <20170206181456.290B281DBC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=121e86c93bf1c6e7f8a76ee09459b457a9d1edc6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replacing ftpmirror.gnu.org with BR2_GNU_MIRROR variable

Signed-off-by: Brian 'redbeard' Harrington <redbeard@coreos.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lightning/lightning.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lightning/lightning.mk b/package/lightning/lightning.mk
index b74147a..052e593 100644
--- a/package/lightning/lightning.mk
+++ b/package/lightning/lightning.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIGHTNING_VERSION = 2.1.0
-LIGHTNING_SITE = http://ftp.gnu.org/gnu/lightning
+LIGHTNING_SITE = $(BR2_GNU_MIRROR)/lightning
 LIGHTNING_LICENSE = LGPLv3+
 LIGHTNING_LICENSE_FILES = COPYING.LESSER
 LIGHTNING_INSTALL_STAGING = YES
