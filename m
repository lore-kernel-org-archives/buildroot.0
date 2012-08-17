From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Aug 2012 18:02:19 +0200
Subject: [Buildroot] [git commit] Added QMAKESPEC to the list of unexported
	symbols
Message-ID: <20120817160233.87B80971B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=32314b44717d655d86b7ff3f557313da8fea4183
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Building QT might fail if QMAKESPEC is defined.

Signed-off-by: Stephan Hoffmann <sho@relinux.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index 9ab7d99..77ca4a0 100644
--- a/Makefile
+++ b/Makefile
@@ -209,6 +209,7 @@ unexport CFLAGS
 unexport CXXFLAGS
 unexport GREP_OPTIONS
 unexport CONFIG_SITE
+unexport QMAKESPEC
 
 GNU_HOST_NAME:=$(shell support/gnuconfig/config.guess)
 
