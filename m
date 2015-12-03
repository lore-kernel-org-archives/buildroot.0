From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 3 Dec 2015 21:41:42 +0100
Subject: [Buildroot] [git commit] gesftpserver: bump to version 0.2.1
Message-ID: <20151203211258.CA1A780ADB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1736fc2a3465b2711b0e1678ede5ebd440d17814
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gesftpserver/gesftpserver.hash | 2 +-
 package/gesftpserver/gesftpserver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gesftpserver/gesftpserver.hash b/package/gesftpserver/gesftpserver.hash
index b952cf0..b4c9fdf 100644
--- a/package/gesftpserver/gesftpserver.hash
+++ b/package/gesftpserver/gesftpserver.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	1db183e2d4cca5cc3ef10526f417ddef28e0402d0119030a06227bf925e63872	sftpserver-0.1.tar.gz
+sha256	5f744c38df9bb82f5ab500858a0fb4767ac3ee2254301da03cbcf8e6c587cbf5	sftpserver-0.2.1.tar.gz
diff --git a/package/gesftpserver/gesftpserver.mk b/package/gesftpserver/gesftpserver.mk
index 16f70fd..25c947a 100644
--- a/package/gesftpserver/gesftpserver.mk
+++ b/package/gesftpserver/gesftpserver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GESFTPSERVER_VERSION = 0.1
+GESFTPSERVER_VERSION = 0.2.1
 GESFTPSERVER_SOURCE = sftpserver-$(GESFTPSERVER_VERSION).tar.gz
 GESFTPSERVER_SITE = http://www.greenend.org.uk/rjk/sftpserver
 GESFTPSERVER_LICENSE = GPLv2+
