From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Dec 2015 14:53:48 +0100
Subject: [Buildroot] [git commit] wireshark: update help text
Message-ID: <20151230135351.753DE8274C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4e841b2a7ff8b2752e74316bea78b115b79324b7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit 00be67d84696 (wireshark: enable GUI options, 2015-12-02) the GUI
is enabled when the required libraries are present. Update the config help
text accordingly.

Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wireshark/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/wireshark/Config.in b/package/wireshark/Config.in
index 52b0f52..defeb4b 100644
--- a/package/wireshark/Config.in
+++ b/package/wireshark/Config.in
@@ -6,8 +6,7 @@ config BR2_PACKAGE_WIRESHARK
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
 	help
-	  Network traffic sniffer and protocol decoder. Currently only tshark,
-	  the console interface, is enabled.
+	  Network traffic sniffer and protocol decoder.
 
 	  http://www.wireshark.org
 
