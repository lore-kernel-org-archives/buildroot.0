From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 5 Sep 2016 14:40:10 +0100
Subject: [Buildroot] [PATCH 4/6] mutt: bump version to 1.7.0
In-Reply-To: <1473082812-690-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1473082812-690-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1473082812-690-4-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
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
-- 
2.7.3
