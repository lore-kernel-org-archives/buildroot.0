From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 24 Mar 2017 11:42:19 +0000
Subject: [Buildroot] [PATCH] lft: bump version to 3.78
Message-ID: <20170324114219.15563-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/lft/lft.hash | 6 ++++--
 package/lft/lft.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/lft/lft.hash b/package/lft/lft.hash
index b045e7c..28654f5 100644
--- a/package/lft/lft.hash
+++ b/package/lft/lft.hash
@@ -1,2 +1,4 @@
-# Locally calculated, matches download from fossies.org and pwhois.org
-sha256	d182d6774e64dcdeb19ed1a598fa588e57ddb6cbb6847d9277c405d3a4597d89	lft-3.77.tar.gz
+# From http://pwhois.org/lft/
+md5 7d20fd5323137b208abf1b4e1355c153  lft-3.78.tar.gz
+# Locally calculated
+sha256 000575891b4094319a56d395c0ec576651fe76b251596ab19d3eb2e5f8d4bf78  lft-3.78.tar.gz
diff --git a/package/lft/lft.mk b/package/lft/lft.mk
index 72f43fa..cac3774 100644
--- a/package/lft/lft.mk
+++ b/package/lft/lft.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LFT_VERSION = 3.77
+LFT_VERSION = 3.78
 LFT_SITE = http://pwhois.org/get
 LFT_DEPENDENCIES = libpcap
 LFT_LICENSE = VOSTROM Public License for Open Source
-- 
2.10.2
