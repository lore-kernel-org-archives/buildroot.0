From: Martin Bark <martin@barkynet.com>
Date: Thu,  8 Mar 2018 16:16:40 +0000
Subject: [Buildroot] [PATCH 3/4] package/c-ares: bump version to 1.14.0
In-Reply-To: <1520525801-23577-1-git-send-email-martin@barkynet.com>
References: <1520525801-23577-1-git-send-email-martin@barkynet.com>
Message-ID: <1520525801-23577-3-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/c-ares/c-ares.hash | 2 +-
 package/c-ares/c-ares.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/c-ares/c-ares.hash b/package/c-ares/c-ares.hash
index 79928ae..832c4df 100644
--- a/package/c-ares/c-ares.hash
+++ b/package/c-ares/c-ares.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 03f708f1b14a26ab26c38abd51137640cb444d3ec72380b21b20f1a8d2861da7 c-ares-1.13.0.tar.gz
+sha256 45d3c1fd29263ceec2afc8ff9cd06d5f8f889636eb4e80ce3cc7f0eaf7aadc6e c-ares-1.14.0.tar.gz
diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
index 72019a0..6725424 100644
--- a/package/c-ares/c-ares.mk
+++ b/package/c-ares/c-ares.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-C_ARES_VERSION = 1.13.0
+C_ARES_VERSION = 1.14.0
 C_ARES_SITE = http://c-ares.haxx.se/download
 C_ARES_INSTALL_STAGING = YES
 C_ARES_CONF_OPTS = --with-random=/dev/urandom
-- 
2.7.4
