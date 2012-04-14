From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 14 Apr 2012 23:54:00 +0200
Subject: [Buildroot] [git commit] dosfstools: bump to version 3.0.12
Message-ID: <20120414215737.E6FB996A79@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f30971329649add986dcb117668ea755266bba5b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dosfstools/dosfstools.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
index e1b6a33..7a8a7e8 100644
--- a/package/dosfstools/dosfstools.mk
+++ b/package/dosfstools/dosfstools.mk
@@ -3,8 +3,8 @@
 # dosfstools
 #
 #############################################################
-DOSFSTOOLS_VERSION = 3.0.11
-DOSFSTOOLS_SOURCE = dosfstools-$(DOSFSTOOLS_VERSION).tar.gz
+
+DOSFSTOOLS_VERSION = 3.0.12
 DOSFSTOOLS_SITE = http://www.daniel-baumann.ch/software/dosfstools
 MKDOSFS_BINARY = mkdosfs
 DOSFSCK_BINARY = dosfsck
