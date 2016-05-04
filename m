From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 4 May 2016 22:45:55 +0200
Subject: [Buildroot] [git commit] mutt: bump version to 1.6.1
Message-ID: <20160504205128.7E168802B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d807b457f205d4c71c5717afaa537f6b4a9d566c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
