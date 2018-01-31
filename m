From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Jan 2018 16:15:06 +0100
Subject: [Buildroot] [git commit] dnsmasq: update homepage link
Message-ID: <20180131152435.CAF81818CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f9da847d93c061b2242547343cb4a707e8f1179d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The doc.html seems like a better choice for a homepage link than the
list of files in the containing directory listing.

Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dnsmasq/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dnsmasq/Config.in b/package/dnsmasq/Config.in
index 8921fc629d..262aca688e 100644
--- a/package/dnsmasq/Config.in
+++ b/package/dnsmasq/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_DNSMASQ
 	  A lightweight DNS and DHCP server. It is intended to provide
 	  coupled DNS and DHCP service to a LAN.
 
-	  http://www.thekelleys.org.uk/dnsmasq/
+	  http://www.thekelleys.org.uk/dnsmasq/doc.html
 
 if BR2_PACKAGE_DNSMASQ
 
