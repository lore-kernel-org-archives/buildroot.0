From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 4 Mar 2013 20:59:56 +0100
Subject: [Buildroot] [git commit] libnetfilter_acct: bump to version 1.0.2
Message-ID: <20130304200438.2E2DB9AEAF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6c1df894a972bb60a0a1863710f71807e7307343
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libnetfilter_acct/libnetfilter-acct.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libnetfilter_acct/libnetfilter-acct.mk b/package/libnetfilter_acct/libnetfilter-acct.mk
index 615c94c..f08fc44 100644
--- a/package/libnetfilter_acct/libnetfilter-acct.mk
+++ b/package/libnetfilter_acct/libnetfilter-acct.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBNETFILTER_ACCT_VERSION = 1.0.1
+LIBNETFILTER_ACCT_VERSION = 1.0.2
 LIBNETFILTER_ACCT_SOURCE = libnetfilter_acct-$(LIBNETFILTER_ACCT_VERSION).tar.bz2
 LIBNETFILTER_ACCT_SITE = http://www.netfilter.org/projects/libnetfilter_acct/files
 LIBNETFILTER_ACCT_INSTALL_STAGING = YES
