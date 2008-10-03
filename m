From: Jason Curl <jcurlnews@arcor.de>
Date: Fri, 03 Oct 2008 17:36:54 +0200
Subject: [Buildroot] Updates for GCC 4.3.2, MPFR 2.3.2, GMP 4.2.4,
	Binutils 2.19.50
Message-ID: <48E63C16.4040603@arcor.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a patch to the buildroot source tree to add support for new 
compilers. I've only built the compiler tool-suite with uClibC for x86. 
There are no patches for the toolchains incorporated, as I'm not 
familiar with them.

It's was done in necessity that GCC 4.3.1 wouldn't compile with 
buildroot. See http://busybox.net/bugs/view.php?id=4384

I modified the .mk files for support to compile
* GCC 4.3.2
* MPFR 2.3.2
* GMP 4.2.4
* Bin Utils 2.19.50 (from ftp://sourceware.org that has fixes already 
for the texinfo version problem).

Regards,
Jason.
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: buildroot.diff
Url: http://busybox.net/lists/buildroot/attachments/20081003/950020e8/attachment.txt 
