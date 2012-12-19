From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 19 Dec 2012 14:50:26 +0100
Subject: [Buildroot] [git commit] pcmanfm: use a download URL from
	downloads.sourceforge.net
Message-ID: <20121219140106.517DF9A3BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fff080bdfa7f6a8f18c8b8f7d0d26035b7438e80
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: use PCMANFM_VERSION in _SITE]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/pcmanfm/pcmanfm.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pcmanfm/pcmanfm.mk b/package/pcmanfm/pcmanfm.mk
index e4c23ec..3b0b727 100644
--- a/package/pcmanfm/pcmanfm.mk
+++ b/package/pcmanfm/pcmanfm.mk
@@ -5,7 +5,7 @@
 #############################################################
 PCMANFM_VERSION = 0.3.5.9
 PCMANFM_SOURCE = pcmanfm-$(PCMANFM_VERSION).tar.gz
-PCMANFM_SITE = http://internap.dl.sourceforge.net/sourceforge/pcmanfm
+PCMANFM_SITE = http://downloads.sourceforge.net/project/pcmanfm/pcmanfm-legacy%20%28Old%200.5%20series%29/PCManFM%20$(PCMANFM_VERSION)
 PCMANFM_CONF_OPT = --disable-hal
 PCMANFM_DEPENDENCIES = host-pkgconf libgtk2 gamin startup-notification xserver_xorg-server
 PCMANFM_AUTORECONF = YES
