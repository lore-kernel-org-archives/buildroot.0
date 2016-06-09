From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu,  9 Jun 2016 11:33:35 +0200
Subject: [Buildroot] [PATCH] package/shairport-sync: bump to version 2.8.4
In-Reply-To: <20160609093335.9216-1-joerg.krause@embedded.rocks>
References: <20160609093335.9216-1-joerg.krause@embedded.rocks>
Message-ID: <20160609093335.9216-4-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/shairport-sync/shairport-sync.hash | 2 +-
 package/shairport-sync/shairport-sync.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/shairport-sync/shairport-sync.hash b/package/shairport-sync/shairport-sync.hash
index a452bbd..907a71e 100644
--- a/package/shairport-sync/shairport-sync.hash
+++ b/package/shairport-sync/shairport-sync.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  4dfdaf0883b94c7061c894be295c878ede3048355bd415905db14ccb74159b72  shairport-sync-2.8.3.tar.gz
+sha256  80dd94c5f37b43e9b157dd5335f8edaf11109859d0144e0046c7b86fe88f6547  shairport-sync-2.8.4.tar.gz
diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index 32127b1..49c6604 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SHAIRPORT_SYNC_VERSION = 2.8.3
+SHAIRPORT_SYNC_VERSION = 2.8.4
 SHAIRPORT_SYNC_SITE = $(call github,mikebrady,shairport-sync,$(SHAIRPORT_SYNC_VERSION))
 
 SHAIRPORT_SYNC_LICENSE = MIT, BSD-3c
-- 
2.8.3
