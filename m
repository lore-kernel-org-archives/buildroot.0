From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Jul 2014 09:54:34 +0200
Subject: [Buildroot] [git commit] transmission: security bump to version 2.84
Message-ID: <20140717075920.AF72B9D26A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=74d217d3db527c94a171d533a85c20dde7d7e588
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2014-4909 (peer communication vulnerability).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/transmission/transmission.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index 07a76ab..10a11d4 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TRANSMISSION_VERSION = 2.83
+TRANSMISSION_VERSION = 2.84
 TRANSMISSION_SITE = http://download.transmissionbt.com/files/
 TRANSMISSION_SOURCE = transmission-$(TRANSMISSION_VERSION).tar.xz
 TRANSMISSION_DEPENDENCIES = \
