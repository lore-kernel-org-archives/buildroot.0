From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 3 May 2016 14:08:41 +0100
Subject: [Buildroot] [PATCH 3/4] mutt: bump version to 1.6.1
In-Reply-To: <1462280922-17100-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1462280922-17100-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1462280922-17100-3-git-send-email-Vincent.Riera@imgtec.com>
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
index 324c04b..baee620 100644
--- a/package/mutt/mutt.hash
+++ b/package/mutt/mutt.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	29afb6238ab7a540c0e3a78ce25c970f975ab6c0f0bc9f919993aab772136c19	mutt-1.6.0.tar.gz
+sha256 98b26cecc6b1713082fc880344fa345c20bd7ded6459abe18c84429c7cf8ed20  mutt-1.6.1.tar.gz
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index 3ab64d5..e6ea6e4 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUTT_VERSION = 1.6.0
+MUTT_VERSION = 1.6.1
 MUTT_SITE = https://bitbucket.org/mutt/mutt/downloads
 MUTT_LICENSE = GPLv2+
 MUTT_LICENSE_FILES = GPL
-- 
2.7.3
