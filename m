From: Kees van Unen <keesvanunen@hotmail.com>
Date: Sat, 16 Dec 2017 08:25:46 +0000
Subject: [Buildroot] FW:  [PATCH] shairport-sync: bump to version 3.1.6
In-Reply-To: <20171216082527.14098-1-joerg.krause@embedded.rocks>
References: <20171216082527.14098-1-joerg.krause@embedded.rocks>
Message-ID: <fdf1830be55d41d1bcb56d56549ee2c0@AM5PR0801MB1394.eurprd08.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net




________________________________________
Van: buildrootNamensJ?rg Krause
Verzonden: zaterdag 16 december 2017 09:25:27 (UTC+01:00) Amsterdam, Berlijn, Bern, Rome, Stockholm, Wenen
Aan: buildroot at buildroot.org
Onderwerp: [Buildroot] [PATCH] shairport-sync: bump to version 3.1.6

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/shairport-sync/shairport-sync.hash | 2 +-
 package/shairport-sync/shairport-sync.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/shairport-sync/shairport-sync.hash b/package/shairport-sync/shairport-sync.hash
index e8ebdd4202..e0eea4c42f 100644
--- a/package/shairport-sync/shairport-sync.hash
+++ b/package/shairport-sync/shairport-sync.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  262808b4ae1a897837384b519ab8736e3189d45f147a31bf8327d313ab6d8e7f  shairport-sync-3.1.5.tar.gz
+sha256  90555f1a5e05bd777741147d5c0104543d0f26d4f95b9bfd44143c818a6f50f1  shairport-sync-3.1.6.tar.gz
diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index 76b3a0034c..53ebcc581e 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################

-SHAIRPORT_SYNC_VERSION = 3.1.5
+SHAIRPORT_SYNC_VERSION = 3.1.6
 SHAIRPORT_SYNC_SITE = $(call github,mikebrady,shairport-sync,$(SHAIRPORT_SYNC_VERSION))

 SHAIRPORT_SYNC_LICENSE = MIT, BSD-3-Clause
--
2.15.1

_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
