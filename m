From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Nov 2015 15:19:18 +0100
Subject: [Buildroot] Poco 1.6.1 with glib for Raspberry Pi
In-Reply-To: <56388339.6080904@prosystems.de>
References: <56388339.6080904@prosystems.de>
Message-ID: <20151103151918.1aa989ea@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Benno,

Thanks for your report! See below for those additional questions to
better understand what's going on and hopefully help resolve the issue.

On Tue, 3 Nov 2015 10:49:45 +0100, Benno wrote:

> I got Problems with POCO 1.6.1 compiles with the 'unbundled' Flag for 
> Raspberry Pi.
> 
> When I compile my program with the POCO libs from buildroot this error 
> appear:
> 
> 
> |..../libPocoFoundation.so: undefined reference to `_pcre_ucd_stage1' 
> |||....|/libPocoFoundation.so: undefined reference to 
> `_pcre_ucd_records' |||....|/libPocoFoundation.so: undefined reference 
> to `_pcre_ucp_gentype' |||....|/libPocoFoundation.so: undefined 
> reference to `_pcre_ucd_stage2'|

Can you give us a sample program that allows us to reproduce the
problem ?

> after a short internet search I found out that other people have the 
> same problem too but no clear solution to solve it.
> 
> I made sure that the packages pcre, zlib, expat and sqlite are checked 
> in buildroot then the program run through compilation,
> but when I execute it on the pi the program returns with the error:
> 
> 'undefined symbole: _prce_ucd_stage1'
> 
> Did I missed something important?

Same here, can you give a sample program that allows us to reproduce ?

> For my kernel I use glibc, for the FPEnviroment.

Is the sentence incomplete? "for the FPEnvironment" doesn't really mean
anything.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
