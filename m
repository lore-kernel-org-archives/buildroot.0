From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 12 Sep 2013 09:39:34 +0200
Subject: [Buildroot] [git commit] dosfstools: bump to version 3.0.22
Message-ID: <20130912080443.017609B6F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=65459f4571baefb58e4a90421ddaeb349ecc4509
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dosfstools/dosfstools.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
index d6ecb6f..c94f680 100644
--- a/package/dosfstools/dosfstools.mk
+++ b/package/dosfstools/dosfstools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOSFSTOOLS_VERSION = 3.0.20
+DOSFSTOOLS_VERSION = 3.0.22
 DOSFSTOOLS_SOURCE = dosfstools-$(DOSFSTOOLS_VERSION).tar.xz
 DOSFSTOOLS_SITE = http://daniel-baumann.ch/files/software/dosfstools
 DOSFSTOOLS_LICENSE = GPLv3+
