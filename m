From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:56:44 -0000
Subject: [Buildroot] [git commit branch/next] musepack: add hash file
Message-ID: <20150808105635.1B2BB7FB5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fc7e614e4a6ef136a99965ec2d6328f5471bfafc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
