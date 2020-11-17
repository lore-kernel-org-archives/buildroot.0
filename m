From: Mircea GLIGA <gliga.mircea@gmail.com>
Date: Tue, 17 Nov 2020 10:37:48 +0200
Subject: [Buildroot] [PATCH v2] package/mbuffer: bump to version 20200929
In-Reply-To: <20201117082244.1012421-1-mgliga@bitdefender.com>
References: <20201117082244.1012421-1-mgliga@bitdefender.com>
Message-ID: <20201117083748.1014236-1-mgliga@bitdefender.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mircea GLIGA <mgliga@bitdefender.com>
---
Changes v1 -> v2:
  - Update hash file with correct filename for md5
 package/mbuffer/mbuffer.hash | 4 ++--
 package/mbuffer/mbuffer.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mbuffer/mbuffer.hash b/package/mbuffer/mbuffer.hash
index 688ada6900..73a8d3cf44 100644
--- a/package/mbuffer/mbuffer.hash
+++ b/package/mbuffer/mbuffer.hash
@@ -1,8 +1,8 @@
 # From http://www.maier-komor.de/mbuffer.html
-md5  df39047654456f260665d66711cabcc5  mbuffer-20200505.tgz
+md5  e2b4f3b0d0944c08d52c167841bde3c0  mbuffer-20200929.tgz
 
 # Locally computed after checking signature upstream
-sha256  cc046183149e51814c23b9f83fd748cc1625a88ee128651ea500aa7bd5f01f0b  mbuffer-20200505.tgz
+sha256  53a6e3c14e9a049f18a09840653dd84f18e7ec7560f2dcf2b61c0ab5f0ead4e8  mbuffer-20200929.tgz
 
 # Hash for license file
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
diff --git a/package/mbuffer/mbuffer.mk b/package/mbuffer/mbuffer.mk
index 6aaf29c9ca..90a72ce657 100644
--- a/package/mbuffer/mbuffer.mk
+++ b/package/mbuffer/mbuffer.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MBUFFER_VERSION = 20200505
+MBUFFER_VERSION = 20200929
 MBUFFER_SOURCE = mbuffer-$(MBUFFER_VERSION).tgz
 MBUFFER_SITE = http://www.maier-komor.de/software/mbuffer
 MBUFFER_LICENSE = GPL-3.0+
-- 
2.29.2
