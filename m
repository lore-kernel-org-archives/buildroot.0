From: Jonathan Dumaresq <jdumaresq@cimeq.qc.ca>
Date: Fri, 31 Oct 2008 11:05:58 -0400
Subject: [Buildroot] my first patch !
Message-ID: <!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAAIMsuCDiF8RCojvQ+E2NNJQBAAAAAA==@cimeq.qc.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I have a small patch for net-snmp to add the avr32 build to the machine
availability. 

This is the first patch that I make. So if I need to modify the way of doing
it, please let me know. 

Index: net-snmp-5.1.2/config.sub
===================================================================
--- net-snmp-5.1.2.orig/config.sub      2008-10-31 10:26:47.000000000 -0400
+++ net-snmp-5.1.2/config.sub   2008-10-31 10:28:27.000000000 -0400
@@ -228,7 +228,7 @@
        | a29k \
        | alpha | alphaev[4-8] | alphaev56 | alphaev6[78] | alphapca5[67] \
        | alpha64 | alpha64ev[4-8] | alpha64ev56 | alpha64ev6[78] |
alpha64pca5[67] \
-       | arc | arm | arm[bl]e | arme[lb] | armv[2345] | armv[345][lb] | avr
\
+       | arc | arm | arm[bl]e | arme[lb] | armv[2345] | armv[345][lb] | avr
| avr32 \
        | clipper \
        | d10v | d30v | dlx | dsp16xx \
        | fr30 | frv \

Jonathan
-------------- next part --------------
A non-text attachment was scrubbed...
Name: config.sub.diff
Type: application/octet-stream
Size: 638 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20081031/a9d12a60/attachment.obj 
