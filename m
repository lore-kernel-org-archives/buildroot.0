From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 25 Jun 2017 21:26:15 +0200
Subject: [Buildroot] [PATCH 3/9] s6-dns: bump version to 2.2.0.0
In-Reply-To: <20170625192621.24188-1-eric.le.bihan.dev@free.fr>
References: <20170625192621.24188-1-eric.le.bihan.dev@free.fr>
Message-ID: <20170625192621.24188-4-eric.le.bihan.dev@free.fr>
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
index 7cfb9c3..dd033be 100644
--- a/package/s6-dns/s6-dns.hash
+++ b/package/s6-dns/s6-dns.hash
@@ -1,2 +1,2 @@
 # Locally generated
-sha256 8455f3b1edad8f01a1340cb1242c141755729bfd5d71059739eced5c006539ad s6-dns-2.1.0.0.tar.gz
+sha256 06856745aa034a1655b7d8226a4b235579b098c58b6009d92151dedd41b15fc2 s6-dns-2.2.0.0.tar.gz
diff --git a/package/s6-dns/s6-dns.mk b/package/s6-dns/s6-dns.mk
index d77956f..b2d5dbc 100644
--- a/package/s6-dns/s6-dns.mk
+++ b/package/s6-dns/s6-dns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_DNS_VERSION = 2.1.0.0
+S6_DNS_VERSION = 2.2.0.0
 S6_DNS_SITE = http://skarnet.org/software/s6-dns
 S6_DNS_LICENSE = ISC
 S6_DNS_LICENSE_FILES = COPYING
-- 
2.9.4
