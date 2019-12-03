From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Dec 2019 17:38:30 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/libpciaccess:
 update help text in Config.in
Message-ID: <20191203163030.6B800869D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b3a6113c5dec8881fdc73e95b76bf4785dda8798
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Add a short package description. Add an upstream URL to address
the 'Missing' URL status in the package stats web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d62d373184426d5bf960dd5c76ba1496b81b5178)
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
