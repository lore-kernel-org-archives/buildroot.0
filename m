From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Sep 2014 11:17:35 +0200
Subject: [Buildroot] Missing Buildroot x86_64 CC Archiver tool in
 eclipse integration
In-Reply-To: <8cbab74434594ef7ab6e81bc2eb88441@DBXPR07MB142.eurprd07.prod.outlook.com>
References: <8cbab74434594ef7ab6e81bc2eb88441@DBXPR07MB142.eurprd07.prod.outlook.com>
Message-ID: <20140906111735.2fec93fc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Oded Hanson,

On Fri, 5 Sep 2014 18:55:00 +0000, Oded Hanson wrote:

> I am trying to build a static library in eclipse using the buildroot toolchain and the buildroot eclipse plugin.
> 
> I have successfully created shared objects and executables but now when I am trying to create a static library, I see that the eclipse plugin doesn't identify the archiver tool, all though the x86_64-buildroot-linux-gnu-ar tool was generated in my buildroot output directory.
> 
> Is this a known issue? Anyway for me to resolve it?

Thanks for your report. I've Cc'ed M?lanie Bats, which is developing
the Buildroot plugin for Eclipse. She'll have a look at this issue soon.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
