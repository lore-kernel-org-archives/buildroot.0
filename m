From: Dick Olsson <hi@senzilla.io>
Date: Tue, 06 Apr 2021 17:57:52 +0000
Subject: [Buildroot] [PATCH 7/9] package/s6-dns: bump to version 2.3.5.0
Message-ID: <UJwmr5wOI0X029hpTwpoVfvasU5uhcwGhhprAeAfI@cp7-web-044.plabs.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Refer to the change set described for s6-networking in the announcement:
http://skarnet.org/cgi-bin/archive.cgi?1:mss:1535:lpehbljhhcpaopbnkkbf

Signed-off-by: Dick Olsson <hi@senzilla.io>
---
 package/s6-dns/s6-dns.hash | 2 +-
 package/s6-dns/s6-dns.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/s6-dns/s6-dns.hash b/package/s6-dns/s6-dns.hash
index 5ee12ae275..8625478f46 100644
--- a/package/s6-dns/s6-dns.hash
+++ b/package/s6-dns/s6-dns.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256 415e3e8a8baaa39b3eac57eef8b3023d63bcdb33d9f9b03bcb298fd940589132  s6-dns-2.3.1.1.tar.gz
+sha256 9f0b71c82cb51e9b7f998978d94c44e5e896fa60105f7233544db539572bb740  s6-dns-2.3.5.0.tar.gz
 sha256 d8e17a6418d26867c13801810903a1f78beac8cfe8f92c2a85afe59f3c3fc48c  COPYING
diff --git a/package/s6-dns/s6-dns.mk b/package/s6-dns/s6-dns.mk
index 7384f07244..9ed75bd600 100644
--- a/package/s6-dns/s6-dns.mk
+++ b/package/s6-dns/s6-dns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_DNS_VERSION = 2.3.1.1
+S6_DNS_VERSION = 2.3.5.0
 S6_DNS_SITE = http://skarnet.org/software/s6-dns
 S6_DNS_LICENSE = ISC
 S6_DNS_LICENSE_FILES = COPYING
-- 
2.30.2
