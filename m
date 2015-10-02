From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Oct 2015 21:50:09 +0200
Subject: [Buildroot] [git commit] mutt: bump to version 1.5.24
Message-ID: <20151002195300.57D0B81914@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=33cfba38521f1096530dc3c3aa76e8dd6da9c37d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch to bitbucket since it's not hosted at sourceforge any more (and
the official mutt source is ftp).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mutt/mutt.hash |    4 ++--
 package/mutt/mutt.mk   |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mutt/mutt.hash b/package/mutt/mutt.hash
index 397f3da..befed13 100644
--- a/package/mutt/mutt.hash
+++ b/package/mutt/mutt.hash
@@ -1,2 +1,2 @@
-# Locally computed:
-sha256  3af0701e57b9e1880ed3a0dee34498a228939e854a16cdccd24e5e502626fd37  mutt-1.5.23.tar.gz
+# Locally calculated
+sha256  a292ca765ed7b19db4ac495938a3ef808a16193b7d623d65562bb8feb2b42200  mutt-1.5.24.tar.gz
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index 92457a1..b07f9b2 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MUTT_VERSION = 1.5.23
-MUTT_SITE = http://downloads.sourceforge.net/project/mutt/mutt
+MUTT_VERSION = 1.5.24
+MUTT_SITE = https://bitbucket.org/mutt/mutt/downloads
 MUTT_LICENSE = GPLv2+
 MUTT_LICENSE_FILES = GPL
 MUTT_DEPENDENCIES = ncurses
