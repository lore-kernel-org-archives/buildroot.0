From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Feb 2018 22:17:28 +0100
Subject: [Buildroot] [git commit] python-crossbar: add missing runtime
 dependency
Message-ID: <20180208211732.838218858C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=66a68930fe217b0bf0ff84600361b05143a6c344
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-crossbar/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-crossbar/Config.in b/package/python-crossbar/Config.in
index 705864471c..96a25c2c69 100644
--- a/package/python-crossbar/Config.in
+++ b/package/python-crossbar/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_PYTHON_CROSSBAR
 	# All the following dependencies are runtime dependencies
 	select BR2_PACKAGE_PYTHON_ATTRS
 	select BR2_PACKAGE_PYTHON_AUTOBAHN
+	select BR2_PACKAGE_PYTHON_BITSTRING
 	select BR2_PACKAGE_PYTHON_CONSTANTLY
 	select BR2_PACKAGE_PYTHON_CBOR
 	select BR2_PACKAGE_PYTHON_CLICK
