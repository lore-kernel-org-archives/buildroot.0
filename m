From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Feb 2015 19:34:35 +0100
Subject: [Buildroot] [git commit branch/next] exfat: add hash
Message-ID: <20150220183540.D06368018E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6a906736e6de12fe8745b92985fa0600bd8956ab
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/exfat/exfat.hash |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/exfat/exfat.hash b/package/exfat/exfat.hash
new file mode 100644
index 0000000..bfaca6e
--- /dev/null
+++ b/package/exfat/exfat.hash
@@ -0,0 +1,2 @@
+# From https://code.google.com/p/exfat/wiki/Downloads?tm=2
+sha1	060560f74dbce4dc947c7e658e75fdf339bc10ff	fuse-exfat-1.1.0.tar.gz
