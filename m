From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Jul 2015 22:36:36 +0200
Subject: [Buildroot] [git commit] libreplaygain: add hash file
Message-ID: <20150716205330.61BB67FBCD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b2e10011c7d048cc657190d7f5c9940669d26df7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libreplaygain/libreplaygain.hash |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/libreplaygain/libreplaygain.hash b/package/libreplaygain/libreplaygain.hash
new file mode 100644
index 0000000..7a61098
--- /dev/null
+++ b/package/libreplaygain/libreplaygain.hash
@@ -0,0 +1,4 @@
+# From https://www.musepack.net/index.php?pg=src
+md5	e27b3b1249b7fbae92d656d9e3d26633	libreplaygain_r475.tar.gz
+# Calculated based on the hash above
+sha256	8258bf785547ac2cda43bb195e07522f0a3682f55abe97753c974609ec232482	libreplaygain_r475.tar.gz
