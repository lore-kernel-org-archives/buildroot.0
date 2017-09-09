From: Petr Kulhavy <brain@jikos.cz>
Date: Sat,  9 Sep 2017 19:17:29 +0200
Subject: [Buildroot] [PATCH 1/1] linuxptp: bump to the latest version
Message-ID: <1504977449-30925-1-git-send-email-brain@jikos.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update Linuxptp to the latest version from 1. September 2017
This update brings bugfixes and minor enhancements.

Signed-off-by: Petr Kulhavy <brain@jikos.cz>
---
 package/linuxptp/linuxptp.hash | 4 ++--
 package/linuxptp/linuxptp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/linuxptp/linuxptp.hash b/package/linuxptp/linuxptp.hash
index ccda2d6..de28ee4 100644
--- a/package/linuxptp/linuxptp.hash
+++ b/package/linuxptp/linuxptp.hash
@@ -1,2 +1,2 @@
-# Locally computed:
-sha256	b8190ab71a99f1dc32847f33cb301d2464d3f9e5f4c51300d55589aff42e8b3f  linuxptp-97c351cafd7327fd28047580c9e2528a6f7e742b.tar.gz
+# No hash for linuxptp, cloned from a remote repo
+none	xxx								  linuxptp-17c9787b1d6891636b5be9e4e5a08278b44e9a7a.tar.gz
diff --git a/package/linuxptp/linuxptp.mk b/package/linuxptp/linuxptp.mk
index bf2176c..38d8e09 100644
--- a/package/linuxptp/linuxptp.mk
+++ b/package/linuxptp/linuxptp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUXPTP_VERSION = 97c351cafd7327fd28047580c9e2528a6f7e742b
+LINUXPTP_VERSION = 17c9787b1d6891636b5be9e4e5a08278b44e9a7a
 LINUXPTP_SITE_METHOD = git
 LINUXPTP_SITE = git://git.code.sf.net/p/linuxptp/code
 LINUXPTP_LICENSE = GPL-2.0+
-- 
2.7.4
