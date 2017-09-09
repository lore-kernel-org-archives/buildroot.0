From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat,  9 Sep 2017 12:34:16 +0200
Subject: [Buildroot] [PATCH 4/9] s6-dns: bump version to 2.2.0.1
In-Reply-To: <20170909103421.30675-1-eric.le.bihan.dev@free.fr>
References: <20170909103421.30675-1-eric.le.bihan.dev@free.fr>
Message-ID: <20170909103421.30675-5-eric.le.bihan.dev@free.fr>
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
index dd033be480..2e019ce7d6 100644
--- a/package/s6-dns/s6-dns.hash
+++ b/package/s6-dns/s6-dns.hash
@@ -1,2 +1,2 @@
 # Locally generated
-sha256 06856745aa034a1655b7d8226a4b235579b098c58b6009d92151dedd41b15fc2 s6-dns-2.2.0.0.tar.gz
+sha256 e31b454aef2bd0e35afb497c42dd0d49c011e0535ad2bf4dd6719afcf6e5e6b4  s6-dns-2.2.0.1.tar.gz
diff --git a/package/s6-dns/s6-dns.mk b/package/s6-dns/s6-dns.mk
index b2d5dbccc6..f0c63f35c3 100644
--- a/package/s6-dns/s6-dns.mk
+++ b/package/s6-dns/s6-dns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_DNS_VERSION = 2.2.0.0
+S6_DNS_VERSION = 2.2.0.1
 S6_DNS_SITE = http://skarnet.org/software/s6-dns
 S6_DNS_LICENSE = ISC
 S6_DNS_LICENSE_FILES = COPYING
-- 
2.13.5
