From: Mark Corbin <mark@dibsco.co.uk>
Date: Thu, 28 Nov 2019 17:58:42 +0000
Subject: [Buildroot] [PATCH 1/1] package/musl: add an upstream URL to
 Config.in
Message-ID: <20191128175842.2633-1-mark@dibsco.co.uk>
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
 package/musl/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/musl/Config.in b/package/musl/Config.in
index 67e9e78a14..69da615b63 100644
--- a/package/musl/Config.in
+++ b/package/musl/Config.in
@@ -8,3 +8,5 @@ config BR2_PACKAGE_MUSL
 		&& !(BR2_i386 || BR2_powerpc)
 	# Compatibility headers: cdefs.h, queue.h
 	select BR2_PACKAGE_MUSL_COMPAT_HEADERS
+	help
+	  https://www.musl-libc.org/
-- 
2.20.1
