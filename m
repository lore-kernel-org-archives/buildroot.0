From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 18 Sep 2014 21:44:02 +0200
Subject: [Buildroot] [git commit] libnl: add hash
Message-ID: <20140918195021.2602F9D6E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=653f07fed08df463ee699417decdf09a45c1461a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnl/libnl.hash |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/libnl/libnl.hash b/package/libnl/libnl.hash
new file mode 100644
index 0000000..6188d70
--- /dev/null
+++ b/package/libnl/libnl.hash
@@ -0,0 +1,3 @@
+# From http://lists.infradead.org/pipermail/libnl/2014-July/001549.html
+sha256	8beb7590674957b931de6b7f81c530b85dc7c1ad8fbda015398bc1e8d1ce8ec5 libnl-3.2.25.tar.gz
+md5	03f74d0cd5037cadc8cdfa313bbd195c	libnl-3.2.25.tar.gz
