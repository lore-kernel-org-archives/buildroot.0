From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Mar 2017 23:09:29 +0100
Subject: [Buildroot] [git commit] tslib: update to 1.8
Message-ID: <20170321220933.EFACB82616@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=00c21338655e29b10fa6e59d5abe389abaa4271d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For those who are interested, the release notes:

	https://github.com/kergoth/tslib/releases

Signed-off-by: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tslib/tslib.hash | 4 ++--
 package/tslib/tslib.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tslib/tslib.hash b/package/tslib/tslib.hash
index dea1f91..f8f7ae3 100644
--- a/package/tslib/tslib.hash
+++ b/package/tslib/tslib.hash
@@ -1,2 +1,2 @@
-# https://github.com/kergoth/tslib/releases/download/1.7/tslib-1.7.tar.xz.sha256
-sha256  f2a4a416331dd2f38cea84cc526f23da1c342a2588cfae72fe070908f08b5ce8  tslib-1.7.tar.xz
+# https://github.com/kergoth/tslib/releases/download/1.8/tslib-1.8.tar.xz.sha256
+sha256  be00af1ad643e3535b1958e4e48fea9905888489d7f1480a957c9e3d1cbaeac5  tslib-1.8.tar.xz
diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
index e19c8d2..f3e0d94 100644
--- a/package/tslib/tslib.mk
+++ b/package/tslib/tslib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TSLIB_VERSION = 1.7
+TSLIB_VERSION = 1.8
 TSLIB_SITE = https://github.com/kergoth/tslib/releases/download/$(TSLIB_VERSION)
 TSLIB_SOURCE = tslib-$(TSLIB_VERSION).tar.xz
 TSLIB_LICENSE = GPL, LGPL
