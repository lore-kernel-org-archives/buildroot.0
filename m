From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Dec 2019 14:50:29 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/fmt: add an
 upstream URL to Config.in
Message-ID: <20191203134225.1366A842A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=98d7007b3ee065ede0dc3067471b94c4d3efed70
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Add an upstream URL to the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit fcbe5d93db547d61a56912af403c0a9a65d0aec1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fmt/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/fmt/Config.in b/package/fmt/Config.in
index 69a6fb80a6..8643c9b5af 100644
--- a/package/fmt/Config.in
+++ b/package/fmt/Config.in
@@ -7,5 +7,7 @@ config BR2_PACKAGE_FMT
 	  used as a safe alternative to printf or as a fast alternative
 	  to IOStreams.
 
+	  https://fmt.dev
+
 comment "fmt needs a toolchain w/ C++, wchar"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
