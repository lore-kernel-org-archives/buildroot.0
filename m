From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 7 Apr 2017 17:27:41 +0100
Subject: [Buildroot] [PATCH 1/2] lft: bump version to 3.79
Message-ID: <20170407162742.52416-1-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/lft/lft.hash | 4 ++--
 package/lft/lft.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lft/lft.hash b/package/lft/lft.hash
index 28654f5..1b0454c 100644
--- a/package/lft/lft.hash
+++ b/package/lft/lft.hash
@@ -1,4 +1,4 @@
 # From http://pwhois.org/lft/
-md5 7d20fd5323137b208abf1b4e1355c153  lft-3.78.tar.gz
+md5 746dc08f2e20d0e0240f28873b3bb244  lft-3.79.tar.gz
 # Locally calculated
-sha256 000575891b4094319a56d395c0ec576651fe76b251596ab19d3eb2e5f8d4bf78  lft-3.78.tar.gz
+sha256 08e5c7973551b529c850bffbc7152c4e5f0bcb1f07ebbb39151a7dc9a3bf9de0  lft-3.79.tar.gz
diff --git a/package/lft/lft.mk b/package/lft/lft.mk
index cac3774..0555ab9 100644
--- a/package/lft/lft.mk
+++ b/package/lft/lft.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LFT_VERSION = 3.78
+LFT_VERSION = 3.79
 LFT_SITE = http://pwhois.org/get
 LFT_DEPENDENCIES = libpcap
 LFT_LICENSE = VOSTROM Public License for Open Source
-- 
2.10.2
