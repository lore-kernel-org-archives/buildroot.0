From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Jan 2018 21:37:12 +0100
Subject: [Buildroot] [git commit] s6-dns: bump version to 2.3.0.0
Message-ID: <20180107203751.AEB2483B18@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1ef45eeacdafc54fc1880d8e26b5cb88c69e920c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add license hash.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/s6-dns/s6-dns.hash | 3 ++-
 package/s6-dns/s6-dns.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/s6-dns/s6-dns.hash b/package/s6-dns/s6-dns.hash
index 2e019ce..483d4f0 100644
--- a/package/s6-dns/s6-dns.hash
+++ b/package/s6-dns/s6-dns.hash
@@ -1,2 +1,3 @@
 # Locally generated
-sha256 e31b454aef2bd0e35afb497c42dd0d49c011e0535ad2bf4dd6719afcf6e5e6b4  s6-dns-2.2.0.1.tar.gz
+sha256 a828583e48741927c88de3822283c317c792ffc15d5e9043f29625b87ba38740  s6-dns-2.3.0.0.tar.gz
+sha256 6ee77e7199d69b707ab864ea7a838f9562717aaa41c89413bdb2cf835f95052f  COPYING
diff --git a/package/s6-dns/s6-dns.mk b/package/s6-dns/s6-dns.mk
index f0c63f3..42639aa 100644
--- a/package/s6-dns/s6-dns.mk
+++ b/package/s6-dns/s6-dns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_DNS_VERSION = 2.2.0.1
+S6_DNS_VERSION = 2.3.0.0
 S6_DNS_SITE = http://skarnet.org/software/s6-dns
 S6_DNS_LICENSE = ISC
 S6_DNS_LICENSE_FILES = COPYING
