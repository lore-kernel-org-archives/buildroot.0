From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Feb 2015 23:28:55 +0100
Subject: [Buildroot] [git commit] pkg-stats: ignore linux-ext-fbtft.mk and
	doc-asciidoc.mk
Message-ID: <20150215222932.29B8A8079A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ff82572a7f484b0f78168e9b506c0881408855e3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/pkg-stats |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 9af974d..fad7ae9 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -94,6 +94,7 @@ for i in $(find boot/ linux/ package/ -name '*.mk' | sort) ; do
 
     if test \
 	$i = "boot/common.mk" -o \
+	$i = "linux/linux-ext-fbtft.mk" -o \
 	$i = "linux/linux-ext-xenomai.mk" -o \
 	$i = "linux/linux-ext-rtai.mk" -o \
 	$i = "package/efl/efl.mk" -o \
@@ -106,6 +107,7 @@ for i in $(find boot/ linux/ package/ -name '*.mk' | sort) ; do
 	$i = "package/opengl/opengl.mk" -o \
 	$i = "package/qt5/qt5.mk" -o \
 	$i = "package/x11r7/x11r7.mk" -o \
+	$i = "package/doc-asciidoc.mk" -o \
 	$i = "package/pkg-autotools.mk" -o \
 	$i = "package/pkg-cmake.mk" -o \
 	$i = "package/pkg-kconfig.mk" -o \
