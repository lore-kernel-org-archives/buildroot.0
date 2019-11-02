From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat,  2 Nov 2019 22:32:05 +0100
Subject: [Buildroot] [PATCH 6/9] package/s6-dns: bump version to 2.3.1.1
In-Reply-To: <20191102213208.27075-1-eric.le.bihan.dev@free.fr>
References: <20191102213208.27075-1-eric.le.bihan.dev@free.fr>
Message-ID: <20191102213208.27075-7-eric.le.bihan.dev@free.fr>
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
index ef584d3a8d..5ee12ae275 100644
--- a/package/s6-dns/s6-dns.hash
+++ b/package/s6-dns/s6-dns.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256 b11ce255668b683d785a1ef8ba89551a9586481b8888bc1a66d4b997e68892ca  s6-dns-2.3.1.0.tar.gz
+sha256 415e3e8a8baaa39b3eac57eef8b3023d63bcdb33d9f9b03bcb298fd940589132  s6-dns-2.3.1.1.tar.gz
 sha256 d8e17a6418d26867c13801810903a1f78beac8cfe8f92c2a85afe59f3c3fc48c  COPYING
diff --git a/package/s6-dns/s6-dns.mk b/package/s6-dns/s6-dns.mk
index d2e6ce177a..7384f07244 100644
--- a/package/s6-dns/s6-dns.mk
+++ b/package/s6-dns/s6-dns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_DNS_VERSION = 2.3.1.0
+S6_DNS_VERSION = 2.3.1.1
 S6_DNS_SITE = http://skarnet.org/software/s6-dns
 S6_DNS_LICENSE = ISC
 S6_DNS_LICENSE_FILES = COPYING
-- 
2.21.0
