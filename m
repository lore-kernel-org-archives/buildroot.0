From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Jul 2015 22:36:36 +0200
Subject: [Buildroot] [git commit] musepack: add hash file
Message-ID: <20150716205330.6A8B57FBCD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fc7e614e4a6ef136a99965ec2d6328f5471bfafc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/musepack/musepack.hash |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/musepack/musepack.hash b/package/musepack/musepack.hash
new file mode 100644
index 0000000..b1bd73c
--- /dev/null
+++ b/package/musepack/musepack.hash
@@ -0,0 +1,4 @@
+# From https://www.musepack.net/index.php?pg=src
+md5	754d67be67f713e54baf70fcfdb2817e	musepack_src_r475.tar.gz
+# Calculated based on the hash above
+sha256	a4b1742f997f83e1056142d556a8c20845ba764b70365ff9ccf2e3f81c427b2b	musepack_src_r475.tar.gz
