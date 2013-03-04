From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 4 Mar 2013 14:41:30 +0100
Subject: [Buildroot] [git commit] httping: bump to version 1.6.0
Message-ID: <20130304134119.8182A9AE9D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bbd47813f3196864e4f88aa9f771cf723b5d2fd6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/httping/httping.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/httping/httping.mk b/package/httping/httping.mk
index e92be61..2ebc75e 100644
--- a/package/httping/httping.mk
+++ b/package/httping/httping.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-HTTPING_VERSION = 1.5.7
+HTTPING_VERSION = 1.6
 HTTPING_SOURCE = httping-$(HTTPING_VERSION).tgz
 HTTPING_SITE = http://www.vanheusden.com/httping
 HTTPING_LICENSE = GPLv2
