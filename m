From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 2 Jun 2017 12:01:07 +0100
Subject: [Buildroot] [PATCH] mutt: bump version to 1.8.3
Message-ID: <20170602110107.57633-1-Vincent.Riera@imgtec.com>
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
index 6df2638fa..f6dc472d4 100644
--- a/package/mutt/mutt.hash
+++ b/package/mutt/mutt.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 1d057bf1b565f2c38ee50c9a661654cbbe4165f98e25bfa361ebbd707d96f235  mutt-1.8.2.tar.gz
+sha256 9b81746d67ffeca5ea44f60893b70dc93c86d4bc10187d4dd360185e4d42ed42  mutt-1.8.3.tar.gz
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index 8ff66492d..abd40e5dd 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUTT_VERSION = 1.8.2
+MUTT_VERSION = 1.8.3
 MUTT_SITE = https://bitbucket.org/mutt/mutt/downloads
 MUTT_LICENSE = GPL-2.0+
 MUTT_LICENSE_FILES = GPL
-- 
2.13.0
