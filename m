From: Gilles Talis <gilles.talis@gmail.com>
Date: Sun, 31 Jan 2021 10:50:54 +0100
Subject: [Buildroot] [PATCH] package/faad2: bump to version 2.10.0
In-Reply-To: <20210131095057.945946-1-gilles.talis@gmail.com>
References: <20210131095057.945946-1-gilles.talis@gmail.com>
Message-ID: <20210131095057.945946-3-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/faad2/faad2.hash | 2 +-
 package/faad2/faad2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/faad2/faad2.hash b/package/faad2/faad2.hash
index e9aa78051f..2eb11d73aa 100644
--- a/package/faad2/faad2.hash
+++ b/package/faad2/faad2.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9728b2b94f94ab49363cd229e7377fbe6ef3c311c5cd80da662d53ddb0ee091d  faad2-2.9.2.tar.gz
+sha256  0c6d9636c96f95c7d736f097d418829ced8ec6dbd899cc6cc82b728480a84bfb  faad2-2.10.0.tar.gz
 sha256  d3baf3a54943cf12a994c85867a18dec84f810901b2f2878ddfd77efcc3c150f  COPYING
diff --git a/package/faad2/faad2.mk b/package/faad2/faad2.mk
index 69c44461f2..575abad17e 100644
--- a/package/faad2/faad2.mk
+++ b/package/faad2/faad2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FAAD2_VERSION = 2.9.2
+FAAD2_VERSION = 2.10.0
 FAAD2_SITE = $(call github,knik0,faad2,$(subst .,_,$(FAAD2_VERSION)))
 FAAD2_LICENSE = GPL-2.0
 FAAD2_LICENSE_FILES = COPYING
-- 
2.25.1
