From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2015 22:04:18 +0100
Subject: [Buildroot] [git commit] olsr: comma separate licenses
Message-ID: <20151215210844.D493480409@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4824243aa418ada76191acd65e6be9c4a2c6ba6f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/olsr/olsr.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/olsr/olsr.mk b/package/olsr/olsr.mk
index a96c898..60c8098 100644
--- a/package/olsr/olsr.mk
+++ b/package/olsr/olsr.mk
@@ -12,7 +12,7 @@ OLSR_PLUGINS = arprefresh bmf dot_draw dyn_gw dyn_gw_plain httpinfo jsoninfo \
 	mdns nameservice p2pd pgraph secure txtinfo watchdog
 # Doesn't really need quagga but not very useful without it
 OLSR_PLUGINS += $(if $(BR2_PACKAGE_QUAGGA),quagga)
-OLSR_LICENSE = BSD-3c LGPLv2.1+
+OLSR_LICENSE = BSD-3c, LGPLv2.1+
 OLSR_LICENSE_FILES = license.txt lib/pud/nmealib/LICENSE
 OLSR_DEPENDENCIES = host-flex host-bison
 
