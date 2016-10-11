From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 11 Oct 2016 13:58:49 +0100
Subject: [Buildroot] [PATCH] mutt: bump version to 1.7.1
Message-ID: <20161011125849.7234-1-Vincent.Riera@imgtec.com>
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
index ae7de58..460cd5f 100644
--- a/package/mutt/mutt.hash
+++ b/package/mutt/mutt.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 1d3e987433d8c92ef88a604f4dcefdb35a86ce73f3eff0157e2e491e5b55b345  mutt-1.7.0.tar.gz
+sha256 e9c6f88e83d48690033f0d862a70293ac746286b77241554f5448bc23bd0d6df  mutt-1.7.1.tar.gz
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index 989a1b6..cd44ca1 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUTT_VERSION = 1.7.0
+MUTT_VERSION = 1.7.1
 MUTT_SITE = https://bitbucket.org/mutt/mutt/downloads
 MUTT_LICENSE = GPLv2+
 MUTT_LICENSE_FILES = GPL
-- 
2.10.0
