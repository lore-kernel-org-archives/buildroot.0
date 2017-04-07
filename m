From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Apr 2017 20:05:24 +0200
Subject: [Buildroot] [git commit] lft: bump version to 3.79
Message-ID: <20170407180536.9EB49826E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b04415f58f9606c52f8b265f6133eb0d4ea76e32
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
