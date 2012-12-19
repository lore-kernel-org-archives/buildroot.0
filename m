From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Dec 2012 10:13:22 +0100
Subject: [Buildroot] [PATCH 2/3] pcmanfm: use a download URL from
	downloads.sourceforge.net
In-Reply-To: <1355908403-27224-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1355908403-27224-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1355908403-27224-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pcmanfm/pcmanfm.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pcmanfm/pcmanfm.mk b/package/pcmanfm/pcmanfm.mk
index e4c23ec..8eaa485 100644
--- a/package/pcmanfm/pcmanfm.mk
+++ b/package/pcmanfm/pcmanfm.mk
@@ -5,7 +5,7 @@
 #############################################################
 PCMANFM_VERSION = 0.3.5.9
 PCMANFM_SOURCE = pcmanfm-$(PCMANFM_VERSION).tar.gz
-PCMANFM_SITE = http://internap.dl.sourceforge.net/sourceforge/pcmanfm
+PCMANFM_SITE = http://downloads.sourceforge.net/project/pcmanfm/pcmanfm-legacy%20%28Old%200.5%20series%29/PCManFM%200.3.5.9/
 PCMANFM_CONF_OPT = --disable-hal
 PCMANFM_DEPENDENCIES = host-pkgconf libgtk2 gamin startup-notification xserver_xorg-server
 PCMANFM_AUTORECONF = YES
-- 
1.7.9.5
