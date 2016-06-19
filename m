From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Jun 2016 13:08:58 +0200
Subject: [Buildroot] [PATCH 011/121] package/imx-usb-loader: add hash file
In-Reply-To: <cover.1466334225.git.yann.morin.1998@free.fr>
References: <cover.1466334225.git.yann.morin.1998@free.fr>
Message-ID: <b09dc95b75aae431a22065c29be3f1f146cf592c.1466334225.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/imx-usb-loader/imx-usb-loader.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/imx-usb-loader/imx-usb-loader.hash

diff --git a/package/imx-usb-loader/imx-usb-loader.hash b/package/imx-usb-loader/imx-usb-loader.hash
new file mode 100644
index 0000000..6e1972f
--- /dev/null
+++ b/package/imx-usb-loader/imx-usb-loader.hash
@@ -0,0 +1,2 @@
+# localy computed
+sha256  1e7ee8af34e7d0a3b9761c25a4edfc7140d23132129818d288c74fc0d58796e5  imx-usb-loader-f96aee286ea17c832b7ec922dd76842deb5ce299.tar.gz
-- 
2.7.4
