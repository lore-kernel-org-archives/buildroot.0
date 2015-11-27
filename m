From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Nov 2015 15:44:47 +0100
Subject: [Buildroot] [git commit branch/next] package/monolite: bump to
	version 138
Message-ID: <20151127150842.D0A0081DA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c423a91b9596b77550a7ea2b004b0e8b31ebb725
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This patch bump to version 138 needed for mono 4.2.1.102

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/monolite/monolite.hash |    2 +-
 package/monolite/monolite.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/monolite/monolite.hash b/package/monolite/monolite.hash
index 1139c0a..fa098e2 100644
--- a/package/monolite/monolite.hash
+++ b/package/monolite/monolite.hash
@@ -1,2 +1,2 @@
 # sha256 locally computed
-sha256 07a8573feef0053ec28b98355feba8c83dcfb3f99c2d0913a16a287382daf4b8  monolite-117-latest.tar.gz
+sha256 0cf7aeafb22daeb7ed3398057f0ac88015440901f480ef84cba2431a753f8c1e  monolite-138-latest.tar.gz
diff --git a/package/monolite/monolite.mk b/package/monolite/monolite.mk
index aa6c28c..3c53bff 100644
--- a/package/monolite/monolite.mk
+++ b/package/monolite/monolite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONOLITE_VERSION = 117
+MONOLITE_VERSION = 138
 MONOLITE_SITE = http://storage.bos.xamarin.com/mono-dist-master/latest
 MONOLITE_SOURCE = monolite-$(MONOLITE_VERSION)-latest.tar.gz
 MONOLITE_LICENSE = LGPLv2 or commercial
