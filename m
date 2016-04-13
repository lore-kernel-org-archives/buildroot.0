From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Apr 2016 21:39:15 +0200
Subject: [Buildroot] [git commit] package/mutt: bump version to 1.6.0
Message-ID: <20160413193920.9588781D8B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=37ccd67c0056a5143d4cf77e441a96352b367c91
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mutt/mutt.hash | 2 +-
 package/mutt/mutt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mutt/mutt.hash b/package/mutt/mutt.hash
index befed13..324c04b 100644
--- a/package/mutt/mutt.hash
+++ b/package/mutt/mutt.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  a292ca765ed7b19db4ac495938a3ef808a16193b7d623d65562bb8feb2b42200  mutt-1.5.24.tar.gz
+sha256	29afb6238ab7a540c0e3a78ce25c970f975ab6c0f0bc9f919993aab772136c19	mutt-1.6.0.tar.gz
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index 14c5be9..3ab64d5 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUTT_VERSION = 1.5.24
+MUTT_VERSION = 1.6.0
 MUTT_SITE = https://bitbucket.org/mutt/mutt/downloads
 MUTT_LICENSE = GPLv2+
 MUTT_LICENSE_FILES = GPL
