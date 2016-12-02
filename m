From: Erico Nunes <nunes.erico@gmail.com>
Date: Fri,  2 Dec 2016 23:40:17 +0100
Subject: [Buildroot] [PATCH 1/1] fwts: bump to version V16.11.00
In-Reply-To: <1480718417-21000-1-git-send-email-nunes.erico@gmail.com>
References: <1480718417-21000-1-git-send-email-nunes.erico@gmail.com>
Message-ID: <1480718417-21000-2-git-send-email-nunes.erico@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build- and run-tested on x86_64 and aarch64.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
---
 package/fwts/fwts.hash | 2 +-
 package/fwts/fwts.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fwts/fwts.hash b/package/fwts/fwts.hash
index a3e5758..e23386e 100644
--- a/package/fwts/fwts.hash
+++ b/package/fwts/fwts.hash
@@ -1,2 +1,2 @@
 # Hash from: http://fwts.ubuntu.com/release/SHA256SUMS
-sha256 4bab7a9daa6def8951b160e9f2c14b203459881d0a1279cb19329bec727c9f2d fwts-V16.09.00.tar.gz
+sha256 077b57864515ffdd6d655201da750829f9ccffb8f280eb86d01c2ef184cdcb16 fwts-V16.11.00.tar.gz
diff --git a/package/fwts/fwts.mk b/package/fwts/fwts.mk
index 7ec1d5e..984e368 100644
--- a/package/fwts/fwts.mk
+++ b/package/fwts/fwts.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FWTS_VERSION = V16.09.00
+FWTS_VERSION = V16.11.00
 FWTS_SITE = http://fwts.ubuntu.com/release
 FWTS_STRIP_COMPONENTS = 0
 FWTS_LICENSE = GPLv2, LGPLv2.1, Custom
-- 
2.7.4
