From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Feb 2016 22:27:38 +0100
Subject: [Buildroot] [git commit] dnsmasq: separate licenses with 'or'
	keyword
Message-ID: <20160225213612.50AD581963@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c692ba029c901419c2f4e60b5cd4058f6ae1486b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

dnsmasq is dual licensed so separate licenses with 'or' keyword.

Reviewed-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dnsmasq/dnsmasq.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index a0db81b..b3e8c4c 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -11,7 +11,7 @@ DNSMASQ_MAKE_ENV = $(TARGET_MAKE_ENV) CC="$(TARGET_CC)"
 DNSMASQ_MAKE_OPTS = COPTS="$(DNSMASQ_COPTS)" PREFIX=/usr CFLAGS="$(TARGET_CFLAGS)"
 DNSMASQ_MAKE_OPTS += DESTDIR=$(TARGET_DIR) LDFLAGS="$(TARGET_LDFLAGS)"
 DNSMASQ_DEPENDENCIES = host-pkgconf
-DNSMASQ_LICENSE = Dual GPLv2/GPLv3
+DNSMASQ_LICENSE = GPLv2 or GPLv3
 DNSMASQ_LICENSE_FILES = COPYING COPYING-v3
 
 ifneq ($(BR2_PACKAGE_DNSMASQ_DHCP),y)
