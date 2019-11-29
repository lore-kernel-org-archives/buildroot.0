From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Nov 2019 09:48:35 +0100
Subject: [Buildroot] [git commit] package/mediastreamer: update the upstream
 URL in Config.in
Message-ID: <20191129090525.7D5B5821A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=21827dcc19a21339ece4faf9b52a636ec95d820a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(404)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mediastreamer/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mediastreamer/Config.in b/package/mediastreamer/Config.in
index afaed4a730..b18c83c5e5 100644
--- a/package/mediastreamer/Config.in
+++ b/package/mediastreamer/Config.in
@@ -11,7 +11,7 @@ config BR2_PACKAGE_MEDIASTREAMER
 	  and sending of multimedia streams in linphone, including
 	  voice/video capture, encoding and decoding, and rendering.
 
-	  http://www.linphone.org/eng/documentation/dev/mediastreamer2.html
+	  http://www.linphone.org/technical-corner/mediastreamer2
 
 comment "mediastreamer needs a toolchain w/ threads, C++"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
