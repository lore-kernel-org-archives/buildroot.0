From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Jun 2015 23:05:13 +0200
Subject: [Buildroot] [git commit] package/mtd: add hash file
Message-ID: <20150602211231.617238011D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a4d246a0a3284ceb4559a5c0afa9e437e1f7734b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mtd/mtd.hash |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/mtd/mtd.hash b/package/mtd/mtd.hash
new file mode 100644
index 0000000..79b90ae
--- /dev/null
+++ b/package/mtd/mtd.hash
@@ -0,0 +1,3 @@
+# Locally calculated after checking pgp signature
+# ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-1.5.1.tar.bz2.asc
+sha256 3b2ed1d05f73bd3789a85bebf5072874a72f8daf63552fd44a94e2a9acf1620b mtd-utils-1.5.1.tar.bz2
