From: Petr Kulhavy <brain@jikos.cz>
Date: Sun, 28 Jan 2018 17:00:19 +0100
Subject: [Buildroot] [PATCH 1/3] package: linuxptp: bump to the latest GIT
 version
Message-ID: <1517155221-19399-1-git-send-email-brain@jikos.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Petr Kulhavy <brain@jikos.cz>
---
 package/linuxptp/linuxptp.hash | 2 +-
 package/linuxptp/linuxptp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linuxptp/linuxptp.hash b/package/linuxptp/linuxptp.hash
index 91144df..ef2db56 100644
--- a/package/linuxptp/linuxptp.hash
+++ b/package/linuxptp/linuxptp.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256	40844a69df82853113732f15498f9bce2666d5052293a3d5d40a1983e7b7b6a6  linuxptp-17c9787b1d6891636b5be9e4e5a08278b44e9a7a.tar.gz
+sha256 d0ccc4591966e21819cdc248765ebbe02456bc8ca37845eb7c23c2d1ff9bcf6b  linuxptp-303b08cbf55096aba55bd08a314e0701e5c33482.tar.gz
diff --git a/package/linuxptp/linuxptp.mk b/package/linuxptp/linuxptp.mk
index 38d8e09..f43fee6 100644
--- a/package/linuxptp/linuxptp.mk
+++ b/package/linuxptp/linuxptp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUXPTP_VERSION = 17c9787b1d6891636b5be9e4e5a08278b44e9a7a
+LINUXPTP_VERSION = 303b08cbf55096aba55bd08a314e0701e5c33482
 LINUXPTP_SITE_METHOD = git
 LINUXPTP_SITE = git://git.code.sf.net/p/linuxptp/code
 LINUXPTP_LICENSE = GPL-2.0+
-- 
2.7.4
