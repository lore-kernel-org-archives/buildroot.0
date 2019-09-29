From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 29 Sep 2019 19:10:12 +0200
Subject: [Buildroot] [PATCH 05/10] package/s6-dns: bump version to 2.3.1.0
In-Reply-To: <20190929171017.26831-1-eric.le.bihan.dev@free.fr>
References: <20190929171017.26831-1-eric.le.bihan.dev@free.fr>
Message-ID: <20190929171017.26831-6-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/s6-dns/s6-dns.hash | 2 +-
 package/s6-dns/s6-dns.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/s6-dns/s6-dns.hash b/package/s6-dns/s6-dns.hash
index 483d4f0e4b..755fbb717d 100644
--- a/package/s6-dns/s6-dns.hash
+++ b/package/s6-dns/s6-dns.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256 a828583e48741927c88de3822283c317c792ffc15d5e9043f29625b87ba38740  s6-dns-2.3.0.0.tar.gz
+sha256 b11ce255668b683d785a1ef8ba89551a9586481b8888bc1a66d4b997e68892ca  s6-dns-2.3.1.0.tar.gz
 sha256 6ee77e7199d69b707ab864ea7a838f9562717aaa41c89413bdb2cf835f95052f  COPYING
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
-- 
2.21.0
