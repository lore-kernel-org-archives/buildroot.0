From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 30 Dec 2015 14:30:59 +0200
Subject: [Buildroot] [PATCH] wireshark: update help text
Message-ID: <d89257f5b4e552dc0a49be8caa4bfc394610a1cf.1451478659.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since commit 00be67d84696 (wireshark: enable GUI options, 2015-12-02) the GUI
is enabled when the required libraries are present. Update the config help
text accordingly.

Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/wireshark/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/wireshark/Config.in b/package/wireshark/Config.in
index 52b0f52e64cc..defeb4b3e479 100644
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
 
-- 
2.6.4
