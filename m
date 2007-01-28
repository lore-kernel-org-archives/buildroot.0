From: Ulf Samuelsson <ulf@atmel.com>
Date: Sun, 28 Jan 2007 16:24:02 +0100
Subject: [Buildroot] AVR32 support during ./configure
Message-ID: <1169997842.21218.2.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author:	Ulf Samuelsson
Date:	2007-01-28

Log:
Support AVR32 during GNU configuration

Modified:
	package/gnuconfig/config.sub

Changeset
	package/gnuconfig/config.sub

diff -urN buildroot-0rig/package/gnuconfig/config.sub
buildroot-atmel/package/gnuconfig/config.sub
--- buildroot-0rig/package/gnuconfig/config.sub	2007-01-24
21:57:15.000000000 +0100
+++ buildroot-atmel/package/gnuconfig/config.sub	2007-01-24
22:01:20.000000000 +0100
@@ -241,7 +241,7 @@
 	| alpha | alphaev[4-8] | alphaev56 | alphaev6[78] | alphapca5[67] \
 	| alpha64 | alpha64ev[4-8] | alpha64ev56 | alpha64ev6[78] |
alpha64pca5[67] \
 	| am33_2.0 \
-	| arc | arm | arm[bl]e | arme[lb] | armv[2345] | armv[345][lb] | avr \
+	| arc | arm | arm[bl]e | arme[lb] | armv[2345] | armv[345][lb] | avr |
avr32 \
 	| bfin \
 	| c4x | clipper \
 	| d10v | d30v | dlx | dsp16xx | dvp \
@@ -319,7 +319,7 @@
 	| alpha64-* | alpha64ev[4-8]-* | alpha64ev56-* | alpha64ev6[78]-* \
 	| alphapca5[67]-* | alpha64pca5[67]-* | arc-* \
 	| arm-*  | armbe-* | armle-* | armeb-* | armv*-* \
-	| avr-* \
+	| avr-* | avr32-* \
 	| bfin-* | bs2000-* \
 	| c[123]* | c30-* | [cjt]90-* | c4x-* | c54x-* | c55x-* | c6x-* \
 	| clipper-* | craynv-* | cydra-* \

-------------- next part --------------
A non-text attachment was scrubbed...
Name: package_gnuconfig_config.sub.patch
Type: text/x-patch
Size: 1202 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070128/1aed7d3e/attachment.bin 
