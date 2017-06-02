From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Jun 2017 13:32:44 +0200
Subject: [Buildroot] [git commit] mutt: bump version to 1.8.3
Message-ID: <20170602113408.29E567FC31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7c79bf1643525164e33ca5cfd652f2abfe9ea83f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mutt/mutt.hash | 2 +-
 package/mutt/mutt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mutt/mutt.hash b/package/mutt/mutt.hash
index 6df2638..f6dc472 100644
--- a/package/mutt/mutt.hash
+++ b/package/mutt/mutt.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 1d057bf1b565f2c38ee50c9a661654cbbe4165f98e25bfa361ebbd707d96f235  mutt-1.8.2.tar.gz
+sha256 9b81746d67ffeca5ea44f60893b70dc93c86d4bc10187d4dd360185e4d42ed42  mutt-1.8.3.tar.gz
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index 8ff6649..abd40e5 100644
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
