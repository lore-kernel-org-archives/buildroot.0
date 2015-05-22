From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 22 May 2015 07:29:52 +0300
Subject: [Buildroot] [PATCH 2/2] tiff: add hash
In-Reply-To: <aaa8912d0c6e0b54281fbc749d45982210ec6f18.1432268992.git.baruch@tkos.co.il>
References: <aaa8912d0c6e0b54281fbc749d45982210ec6f18.1432268992.git.baruch@tkos.co.il>
Message-ID: <142151711a52137a98e0359e8cd6bff5edc59d63.1432268992.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/tiff/tiff.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/tiff/tiff.hash

diff --git a/package/tiff/tiff.hash b/package/tiff/tiff.hash
new file mode 100644
index 000000000000..361b5e1b62ae
--- /dev/null
+++ b/package/tiff/tiff.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 ea1aebe282319537fb2d4d7805f478dd4e0e05c33d0928baba76a7c963684872	tiff-4.0.3.tar.gz
-- 
2.1.4
