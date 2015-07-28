From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jul 2015 22:32:56 +0200
Subject: [Buildroot] [git commit] libraw1394: add hash file
Message-ID: <20150728204047.6B41B81E3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0e7ca5814f1424220d72dcdc0ffcfc14ca3224ca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libraw1394/libraw1394.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libraw1394/libraw1394.hash b/package/libraw1394/libraw1394.hash
new file mode 100644
index 0000000..5d18e98
--- /dev/null
+++ b/package/libraw1394/libraw1394.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/libs/ieee1394/sha256sums.asc
+sha256	e3dc814bc8014cc0bd306767c15e686c9b3b07fcacbbf62862fb1c1de2d708a4	libraw1394-2.0.7.tar.xz
