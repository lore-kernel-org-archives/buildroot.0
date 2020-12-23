From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Dec 2020 23:06:30 +0100
Subject: [Buildroot] [git commit branch/2020.08.x] package/mutt: bump to
 version 1.14.7
Message-ID: <20201224083312.3B6017FC74@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=65fee6362f6cac928229df86522c9b718e3fc030
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

This is a bug-fix release, fixing a variety of small issues.

https://gitlab.com/muttmua/mutt/raw/stable/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit af757d959431eb57efe7de1fa8e8b09de5790f3c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mutt/mutt.hash | 2 +-
 package/mutt/mutt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mutt/mutt.hash b/package/mutt/mutt.hash
index e3007370a4..23e5dd0ff1 100644
--- a/package/mutt/mutt.hash
+++ b/package/mutt/mutt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  47972a0152b81b9f67ff322a0a6682b914c15545bfdeac6bcc2f2c0bf9361844  mutt-1.14.6.tar.gz
+sha256  e4f507b133253cb5eef27996b8668956cdf9caac622cf8adad13f0f9a4eda864  mutt-1.14.7.tar.gz
 sha256  732f24b69a6c71cd8e01e4672bb8e12cc1cbb88a50a4665e6ca4fd95000a57ee  GPL
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index 6c85202fc0..0ff03724c1 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUTT_VERSION = 1.14.6
+MUTT_VERSION = 1.14.7
 MUTT_SITE = https://bitbucket.org/mutt/mutt/downloads
 MUTT_LICENSE = GPL-2.0+
 MUTT_LICENSE_FILES = GPL
