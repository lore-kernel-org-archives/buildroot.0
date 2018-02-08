From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu,  8 Feb 2018 10:22:40 +0100
Subject: [Buildroot] [PATCH] python-crossbar: add missing runtime dependency
Message-ID: <1518081760-25218-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-crossbar/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-crossbar/Config.in b/package/python-crossbar/Config.in
index 7058644..96a25c2 100644
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
-- 
2.1.4
