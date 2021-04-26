From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 12:04:29 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/dnsmasq: security
 bump to 2.85
Message-ID: <20210426093832.B64E2812C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=11e0fa9a9b315fb05ae224a7e7ba9dc8ff59d88c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

CVE-2021-3448 applies.  See announcement for details.

Link: https://lists.thekelleys.org.uk/pipermail/dnsmasq-discuss/2021q2/014962.html
Signed-off-by: Alexander Dahl <post@lespocky.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3ce7afbe50602f76c2d81bba28ed03227ecfc509)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dnsmasq/dnsmasq.hash | 4 ++--
 package/dnsmasq/dnsmasq.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dnsmasq/dnsmasq.hash b/package/dnsmasq/dnsmasq.hash
index d141fb0c83..2a7cda4a04 100644
--- a/package/dnsmasq/dnsmasq.hash
+++ b/package/dnsmasq/dnsmasq.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.thekelleys.org.uk/dnsmasq/dnsmasq-2.83.tar.xz.asc
-sha256  603195c64b73137609b07e1024ae0b37f652b2f5fe467dce66985b3d1850050c  dnsmasq-2.84.tar.xz
+# https://www.thekelleys.org.uk/dnsmasq/dnsmasq-2.85.tar.xz.asc
+sha256  ad98d3803df687e5b938080f3d25c628fe41c878752d03fbc6199787fee312fa  dnsmasq-2.85.tar.xz
 # Locally calculated
 sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING-v3
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 76b48f952a..2006757590 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DNSMASQ_VERSION = 2.84
+DNSMASQ_VERSION = 2.85
 DNSMASQ_SOURCE = dnsmasq-$(DNSMASQ_VERSION).tar.xz
 DNSMASQ_SITE = http://thekelleys.org.uk/dnsmasq
 DNSMASQ_MAKE_ENV = $(TARGET_MAKE_ENV) CC="$(TARGET_CC)"
