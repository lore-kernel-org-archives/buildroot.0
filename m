From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 May 2015 15:28:02 +0200
Subject: [Buildroot] [git commit] package/monolite: bump to version 117
Message-ID: <20150502150408.D7F948080E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=170dcb98d721aafd259f3c5c06612d3c4954f079
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bump is required for proper compiling mono 4.0.1.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/monolite/monolite.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/monolite/monolite.mk b/package/monolite/monolite.mk
index b3c7553..aa6c28c 100644
--- a/package/monolite/monolite.mk
+++ b/package/monolite/monolite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONOLITE_VERSION = 111
+MONOLITE_VERSION = 117
 MONOLITE_SITE = http://storage.bos.xamarin.com/mono-dist-master/latest
 MONOLITE_SOURCE = monolite-$(MONOLITE_VERSION)-latest.tar.gz
 MONOLITE_LICENSE = LGPLv2 or commercial
