From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 30 Dec 2019 21:21:56 +0100
Subject: [Buildroot] [git commit] package/wf111: update the upstream URL in
 Config.in
Message-ID: <20191230201321.8EA078E86A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ca75e164a06fa016f35b9658ae1a7f59396ab64c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update the upstream URL in the help text in Config.in. This
addresses an intermittent 'Invalid(404)' URL status in the
package stats web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
[yann.morin.1998 at free.fr: use an even more specific home page]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/wf111/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wf111/Config.in b/package/wf111/Config.in
index 7b61ea195f..8dd20a7cc5 100644
--- a/package/wf111/Config.in
+++ b/package/wf111/Config.in
@@ -17,7 +17,7 @@ config BR2_PACKAGE_WF111
 	    configuration entry that selects them, for example.
 	  - By enabling another random WiFi driver that select them.
 
-	  https://www.silabs.com/products/wireless/wi-fi/wf111-bluegiga-module
+	  https://www.silabs.com/wireless/wi-fi/bluegiga-legacy-modules/device.wf111
 
 comment "wf111 needs a glibc toolchain"
 	depends on BR2_LINUX_KERNEL
