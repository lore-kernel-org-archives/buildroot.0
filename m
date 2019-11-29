From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Nov 2019 10:10:33 +0100
Subject: [Buildroot] [git commit] package/libpciaccess: update help text in
 Config.in
Message-ID: <20191129090526.39E9E81432@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d62d373184426d5bf960dd5c76ba1496b81b5178
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a short package description. Add an upstream URL to address
the 'Missing' URL status in the package stats web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
