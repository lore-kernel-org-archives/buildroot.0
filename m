From: Mark Corbin <mark@dibsco.co.uk>
Date: Tue, 26 Nov 2019 12:06:45 +0000
Subject: [Buildroot] [PATCH 1/1] package/c-capnproto: add an upstream URL to
 Config.in
Message-ID: <20191126120645.8577-1-mark@dibsco.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add an upstream URL to the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
---
 package/c-capnproto/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/c-capnproto/Config.in b/package/c-capnproto/Config.in
index 293e4483cd..d1f3236af8 100644
--- a/package/c-capnproto/Config.in
+++ b/package/c-capnproto/Config.in
@@ -12,6 +12,8 @@ config BR2_PACKAGE_C_CAPNPROTO
 	  plugin for C. Requires regular Cap'n Proto and only
 	  provides serialization (no RPC).
 
+	  https://github.com/opensourcerouting/c-capnproto
+
 comment "c-capnproto needs host and target gcc >= 5 w/ C++14, threads, atomic"
 	depends on BR2_USE_MMU
 	depends on!BR2_HOST_GCC_AT_LEAST_5 || \
-- 
2.20.1
