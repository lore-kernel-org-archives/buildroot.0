From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Sep 2016 21:07:41 +0200
Subject: [Buildroot] [git commit] mutt: bump version to 1.7.0
Message-ID: <20160905190813.474DB7F8D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7c478dfaeeb61748f1ccab0b3e7991b8fa5967d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mutt/mutt.hash | 2 +-
 package/mutt/mutt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mutt/mutt.hash b/package/mutt/mutt.hash
index baee620..ae7de58 100644
--- a/package/mutt/mutt.hash
+++ b/package/mutt/mutt.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 98b26cecc6b1713082fc880344fa345c20bd7ded6459abe18c84429c7cf8ed20  mutt-1.6.1.tar.gz
+sha256 1d3e987433d8c92ef88a604f4dcefdb35a86ce73f3eff0157e2e491e5b55b345  mutt-1.7.0.tar.gz
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index e6ea6e4..989a1b6 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUTT_VERSION = 1.6.1
+MUTT_VERSION = 1.7.0
 MUTT_SITE = https://bitbucket.org/mutt/mutt/downloads
 MUTT_LICENSE = GPLv2+
 MUTT_LICENSE_FILES = GPL
