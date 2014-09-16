From: Oded Hanson <OHanson@xsightsys.com>
Date: Tue, 16 Sep 2014 09:20:30 +0000
Subject: [Buildroot] Missing Buildroot x86_64 CC Archiver tool in
 eclipse integration
In-Reply-To: <20140906111735.2fec93fc@free-electrons.com>
References: <8cbab74434594ef7ab6e81bc2eb88441@DBXPR07MB142.eurprd07.prod.outlook.com>
 <20140906111735.2fec93fc@free-electrons.com>
Message-ID: <6b44c087f1a6477e9c1f35e8d1409db6@DBXPR07MB142.eurprd07.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All

I wanted to know if by any change someone has a solution for this problem?

Thanks

Oded

-----Original Message-----
From: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com] 
Sent: Saturday, September 06, 2014 4:18 PM
To: Oded Hanson
Cc: buildroot at busybox.net; M?lanie Bats
Subject: Re: [Buildroot] Missing Buildroot x86_64 CC Archiver tool in eclipse integration

Dear Oded Hanson,

On Fri, 5 Sep 2014 18:55:00 +0000, Oded Hanson wrote:

> I am trying to build a static library in eclipse using the buildroot toolchain and the buildroot eclipse plugin.
> 
> I have successfully created shared objects and executables but now when I am trying to create a static library, I see that the eclipse plugin doesn't identify the archiver tool, all though the x86_64-buildroot-linux-gnu-ar tool was generated in my buildroot output directory.
> 
> Is this a known issue? Anyway for me to resolve it?

Thanks for your report. I've Cc'ed M?lanie Bats, which is developing the Buildroot plugin for Eclipse. She'll have a look at this issue soon.

Thanks!

Thomas
--
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering http://free-electrons.com
