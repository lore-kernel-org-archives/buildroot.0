From: Vincent Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 2 Oct 2015 17:21:49 +0000
Subject: [Buildroot] [PATCH] mutt: bump to version 1.5.24
In-Reply-To: <1443805873-24176-1-git-send-email-gustavo@zacarias.com.ar>
References: <1443805873-24176-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <38121FAB319C3344930C920E7B5183136A3DBDD1@LEMAIL01.le.imgtec.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

Is there a problem with downloading from an ftp? I think is better to download the sources from the official site.

Regards,

Vincent.


________________________________________
From: buildroot [buildroot-bounces at busybox.net] on behalf of Gustavo Zacarias [gustavo at zacarias.com.ar]
Sent: 02 October 2015 18:11
To: buildroot at busybox.net
Subject: [Buildroot] [PATCH] mutt: bump to version 1.5.24

Switch to bitbucket since it's not hosted at sourceforge any more (and
the official mutt source is ftp).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/mutt/mutt.hash | 4 ++--
 package/mutt/mutt.mk   | 4 ++--
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
--
2.4.9

_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
