From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 4 Mar 2013 21:00:02 +0100
Subject: [Buildroot] [git commit] nfacct: bump to version 1.0.1
Message-ID: <20130304200438.8A37C9AEAF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6017be12eee553ad946706ebc623ffa621051228
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/nfacct/nfacct.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/nfacct/nfacct.mk b/package/nfacct/nfacct.mk
index 60c6e44..cde9cad 100644
--- a/package/nfacct/nfacct.mk
+++ b/package/nfacct/nfacct.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-NFACCT_VERSION = 1.0.0
+NFACCT_VERSION = 1.0.1
 NFACCT_SOURCE = nfacct-$(NFACCT_VERSION).tar.bz2
 NFACCT_SITE = http://www.netfilter.org/projects/nfacct/files
 NFACCT_DEPENDENCIES = host-pkgconf \
