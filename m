From: Fredrik Roubert <roubert@df.lth.se>
Date: Mon, 9 Oct 2006 10:30:39 +0200
Subject: [Buildroot] Wireless Tools 28
Message-ID: <20061009083039.GB20352@igloo.df.lth.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

Currently buildroot is using Wireless Tools 28 pre 3. The final version
of Wireless Tools 28 has been released for several months now, and can
be included in buildroot by just changing version numer and download
path.

The attached patch updates wireless-tools.mk to use Wireless Tools 28,
instead of Wireless Tools 28 pre 3.

Cheers // Fredrik Roubert

-- 
Visserij 192  |  +32 473 344527 / +46 708 776974
BE-9000 Gent  |  http://www.df.lth.se/~roubert/
-------------- next part --------------
diff -urN buildroot-20061006/package/wireless-tools/wireless-tools.mk buildroot/package/wireless-tools/wireless-tools.mk
--- buildroot-20061006/package/wireless-tools/wireless-tools.mk	2006-10-06 09:15:09.000000000 +0200
+++ buildroot/package/wireless-tools/wireless-tools.mk	2006-10-06 15:13:33.000000000 +0200
@@ -9,9 +9,9 @@
 # Jean II
 # v28.pre3 -> earliest possible
 WIRELESS_TOOLS_VER:=28
-WIRELESS_TOOLS_SUBVER:=.pre3
+WIRELESS_TOOLS_SUBVER:=
 
-WIRELESS_TOOLS_SOURCE_URL:=http://www.hpl.hp.com/personal/Jean_Tourrilhes/Linux
+WIRELESS_TOOLS_SOURCE_URL:=http://pcmcia-cs.sourceforge.net/ftp/contrib
 WIRELESS_TOOLS_SOURCE:=wireless_tools.$(WIRELESS_TOOLS_VER)$(WIRELESS_TOOLS_SUBVER).tar.gz
 WIRELESS_TOOLS_BUILD_DIR=$(BUILD_DIR)/wireless_tools.$(WIRELESS_TOOLS_VER)
 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 303 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20061009/fafc918b/attachment.pgp 
