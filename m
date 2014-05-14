From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 14 May 2014 13:24:14 +0200
Subject: [Buildroot] [PATCH 2/2] pkg-stats: fix whitespaces
In-Reply-To: <1400066654-32196-1-git-send-email-fabio.porcedda@gmail.com>
References: <1400066654-32196-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1400066654-32196-2-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove some spaces before tabs and add the empty line at end of file.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/pkg-stats | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index fd60d7d..f5d6ec8 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -101,15 +101,15 @@ for i in $(find boot/ linux/ package/ -name '*.mk' | sort) ; do
 	$i = "package/opengl/opengl.mk" -o \
 	$i = "package/qt5/qt5.mk" -o \
 	$i = "package/x11r7/x11r7.mk" -o \
- 	$i = "package/pkg-autotools.mk" -o \
- 	$i = "package/pkg-cmake.mk" -o \
+	$i = "package/pkg-autotools.mk" -o \
+	$i = "package/pkg-cmake.mk" -o \
 	$i = "package/pkg-luarocks.mk" -o \
 	$i = "package/pkg-perl.mk" -o \
 	$i = "package/pkg-python.mk" -o \
 	$i = "package/pkg-virtual.mk" -o \
 	$i = "package/pkg-download.mk" -o \
- 	$i = "package/pkg-generic.mk" -o \
- 	$i = "package/pkg-utils.mk" ; then
+	$i = "package/pkg-generic.mk" -o \
+	$i = "package/pkg-utils.mk" ; then
 	echo "skipping $i" 1>&2
 	continue
     fi
@@ -347,4 +347,4 @@ echo "</table>"
 echo "<hr/>"
 echo "<i>Updated on $(LANG=C date), Git commit $(git log master -n 1 --pretty=format:%H)</i>"
 echo "</body>"
-echo "</html>"
\ No newline at end of file
+echo "</html>"
-- 
1.9.1
