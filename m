From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Sep 2019 22:53:26 +0200
Subject: [Buildroot] [git commit] package/s6-dns: bump version to 2.3.1.0
Message-ID: <20190930204831.49BED83CCF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=48355ba77cefa59f12f6f818499bda1a0edcfc17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The hash of the COPYING file is updated to take into account the
following copyright year change:

-Copyright (c) 2011-2017 Laurent Bercot <ska-skaware@skarnet.org>
+Copyright (c) 2011-2019 Laurent Bercot <ska-skaware@skarnet.org>

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/s6-dns/s6-dns.hash | 4 ++--
 package/s6-dns/s6-dns.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/s6-dns/s6-dns.hash b/package/s6-dns/s6-dns.hash
index 483d4f0e4b..ef584d3a8d 100644
--- a/package/s6-dns/s6-dns.hash
+++ b/package/s6-dns/s6-dns.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256 a828583e48741927c88de3822283c317c792ffc15d5e9043f29625b87ba38740  s6-dns-2.3.0.0.tar.gz
-sha256 6ee77e7199d69b707ab864ea7a838f9562717aaa41c89413bdb2cf835f95052f  COPYING
+sha256 b11ce255668b683d785a1ef8ba89551a9586481b8888bc1a66d4b997e68892ca  s6-dns-2.3.1.0.tar.gz
+sha256 d8e17a6418d26867c13801810903a1f78beac8cfe8f92c2a85afe59f3c3fc48c  COPYING
diff --git a/package/s6-dns/s6-dns.mk b/package/s6-dns/s6-dns.mk
index 42639aa9c4..d2e6ce177a 100644
--- a/package/s6-dns/s6-dns.mk
+++ b/package/s6-dns/s6-dns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_DNS_VERSION = 2.3.0.0
+S6_DNS_VERSION = 2.3.1.0
 S6_DNS_SITE = http://skarnet.org/software/s6-dns
 S6_DNS_LICENSE = ISC
 S6_DNS_LICENSE_FILES = COPYING
