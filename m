From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Apr 2015 21:53:52 +0200
Subject: [Buildroot] [git commit] procps-ng: needs gettextize
Message-ID: <20150410195446.477D17FC3C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=502565f90abf6fab4d84f22ed99b3d446cdd446d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/904/90401cdb471f9e9582e2ca2ad07fb3db148420d7/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/procps-ng/procps-ng.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
index 4ee60f3..07e98b9 100644
--- a/package/procps-ng/procps-ng.mk
+++ b/package/procps-ng/procps-ng.mk
@@ -13,6 +13,7 @@ PROCPS_NG_INSTALL_STAGING = YES
 PROCPS_NG_DEPENDENCIES = ncurses host-pkgconf
 # For 0002-use-pkgconfig-for-ncursesw-cflags.patch
 PROCPS_NG_AUTORECONF = YES
+PROCPS_NG_GETTEXTIZE = YES
 
 # If both procps-ng and busybox are selected, make certain procps-ng
 # wins the fight over who gets to have their utils actually installed.
