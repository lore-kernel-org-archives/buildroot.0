From: Benno <b.schweikert@prosystems.de>
Date: Tue, 3 Nov 2015 10:49:45 +0100
Subject: [Buildroot] Poco 1.6.1 with glib for Raspberry Pi
Message-ID: <56388339.6080904@prosystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Everyone,

I got Problems with POCO 1.6.1 compiles with the 'unbundled' Flag for 
Raspberry Pi.

When I compile my program with the POCO libs from buildroot this error 
appear:


|..../libPocoFoundation.so: undefined reference to `_pcre_ucd_stage1' 
|||....|/libPocoFoundation.so: undefined reference to 
`_pcre_ucd_records' |||....|/libPocoFoundation.so: undefined reference 
to `_pcre_ucp_gentype' |||....|/libPocoFoundation.so: undefined 
reference to `_pcre_ucd_stage2'|


after a short internet search I found out that other people have the 
same problem too but no clear solution to solve it.

I made sure that the packages pcre, zlib, expat and sqlite are checked 
in buildroot then the program run through compilation,
but when I execute it on the pi the program returns with the error:

'undefined symbole: _prce_ucd_stage1'

Did I missed something important?

For my kernel I use glibc, for the FPEnviroment.
The only POCO packages that I  need are: Foundation, XML, Util, Net and 
Sqlit.
I'm building on a Ubuntu 14.04 64 Bit System.

-- 
Mit freundlichen Gr??en / with best regards


Benno Schweikert

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151103/89c822c8/attachment.html>
