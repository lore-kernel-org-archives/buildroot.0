From: Mark Corbin <mark@dibsco.co.uk>
Date: Thu, 28 Nov 2019 12:56:22 +0000
Subject: [Buildroot] [PATCH 1/1] package/libpciaccess: update help text in
 Config.in
Message-ID: <20191128125622.2899-1-mark@dibsco.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a short package description. Add an upstream URL to address
the 'Missing' URL status in the package stats web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
---
 package/libpciaccess/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libpciaccess/Config.in b/package/libpciaccess/Config.in
index 6cc983f577..1f5d5e6bef 100644
--- a/package/libpciaccess/Config.in
+++ b/package/libpciaccess/Config.in
@@ -2,3 +2,7 @@ config BR2_PACKAGE_LIBPCIACCESS
 	bool "libpciaccess"
 	help
 	  X.Org libpciaccess
+
+	  Generic PCI access library
+
+	  https://gitlab.freedesktop.org/xorg/lib/libpciaccess
-- 
2.20.1
