From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 9 Dec 2012 22:00:50 +0100
Subject: [Buildroot] [git commit] dnsmasq: bump to version 2.64
Message-ID: <20121209210036.246FD9A157@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2fdd70e5986f0a3869c142949e352e62543a1dd1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dnsmasq/dnsmasq.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index dac30e5..afa51e2 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-DNSMASQ_VERSION = 2.63
+DNSMASQ_VERSION = 2.64
 DNSMASQ_SITE = http://thekelleys.org.uk/dnsmasq
 DNSMASQ_MAKE_ENV = CC="$(TARGET_CC)"
 DNSMASQ_MAKE_OPT = COPTS="$(DNSMASQ_COPTS)" PREFIX=/usr CFLAGS="$(TARGET_CFLAGS)"
