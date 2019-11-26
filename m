From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Nov 2019 21:02:29 +0100
Subject: [Buildroot] [git commit] package/faifa: update the upstream URL in
 Config.in
Message-ID: <20191126203656.538B98120D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c7bb566fdacf92a0e4c297630b4fe5631f437632
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(Err)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/faifa/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/faifa/Config.in b/package/faifa/Config.in
index 753abc67ec..486f35d508 100644
--- a/package/faifa/Config.in
+++ b/package/faifa/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_FAIFA
 	  Intellon-specific management and control frames as well as
 	  standard management frames.
 
-	  https://dev.open-plc.org
+	  https://github.com/ffainelli/faifa
 
 comment "faifa needs a toolchain w/ dynamic library, threads"
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
