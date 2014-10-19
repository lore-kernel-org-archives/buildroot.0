From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 17:34:09 +0200
Subject: [Buildroot] [git commit] uclibc: add hash file
Message-ID: <20141019153637.2F265AFC91@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0c53268c5a6f75baeceeb68253e77f4bf154a738
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/uclibc.hash |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
new file mode 100644
index 0000000..0fba41a
--- /dev/null
+++ b/package/uclibc/uclibc.hash
@@ -0,0 +1,4 @@
+# Locally calculated after checking pgp signature (vanilla)
+# Locally calculated (ARC)
+sha256	62333167b79afb0b25a843513288c67b59547acf653e8fbe62ee64e71ebd1587	uClibc-0.9.33.2.tar.xz
+sha256	0a9085a11615296cfe7783f16ff29073393eb330749947adece0eeddb31705a4	uClibc-arc-2014.08.tar.gz
