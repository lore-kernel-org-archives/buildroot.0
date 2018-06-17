From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Jun 2018 17:30:19 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] gnupg: security bump to
 version 1.4.23
Message-ID: <20180617155626.BCB0A826A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e15f712c32d32aa0ba029431e980de28d044bd57
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Fixes CVE-2018-12020: Unsanitized file names might cause injection of
terminal control characters into the status output of gnupg.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0647268416ecf5c50741838fae4fc48b1c0750be)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnupg/gnupg.hash | 4 ++--
 package/gnupg/gnupg.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnupg/gnupg.hash b/package/gnupg/gnupg.hash
index abd76cde9c..3bacdf6563 100644
--- a/package/gnupg/gnupg.hash
+++ b/package/gnupg/gnupg.hash
@@ -1,3 +1,3 @@
 # Locally computed based on signature
-# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-1.4.22.tar.bz2.sig
-sha256	9594a24bec63a21568424242e3f198b9d9828dea5ff0c335e47b06f835f930b4	gnupg-1.4.22.tar.bz2
+# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-1.4.23.tar.bz2.sig
+sha256	c9462f17e651b6507848c08c430c791287cd75491f8b5a8b50c6ed46b12678ba	gnupg-1.4.23.tar.bz2
diff --git a/package/gnupg/gnupg.mk b/package/gnupg/gnupg.mk
index 3ff202b709..ac9047894d 100644
--- a/package/gnupg/gnupg.mk
+++ b/package/gnupg/gnupg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG_VERSION = 1.4.22
+GNUPG_VERSION = 1.4.23
 GNUPG_SOURCE = gnupg-$(GNUPG_VERSION).tar.bz2
 GNUPG_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG_LICENSE = GPL-3.0+
