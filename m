From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Sep 2009 19:29:28 +0200
Subject: [Buildroot] External Toolchain in latest stable buildroot
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE190901CBEE46@mi8nycmail19.Mi8.com>
References: <330EC2471BF24E48B513AF1A6975EB69AD87F9@MAIL-UA.ccs.local>
	<20090911091415.19422fbb@surf>
	<330EC2471BF24E48B513AF1A6975EB69AD8816@MAIL-UA.ccs.local>
	<330EC2471BF24E48B513AF1A6975EB69AD887B@MAIL-UA.ccs.local>
	<BD79186B4FD85F4B8E60E381CAEE190901CBEE46@mi8nycmail19.Mi8.com>
Message-ID: <20090911192928.35f09873@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Hartley,

Le Fri, 11 Sep 2009 13:10:33 -0400,
"H Hartley Sweeten" <hartleys@visionengravers.com> a ?crit :

> The Sourcery G++ Lite 2009q1-203 toolchain is a multilib sysroot
> toolchain. I had similar problems trying to get it to work for an
> EP93XX processor.
> 
> I think the AT91 processor is an ARM920T so you need to pass
> -march=armv4t to the toolchain to in order for it to compile the code
> correctly.  This is the same option I need for the EP93XX.
> 
> I spent the last three weeks trying to get this toolchain to work
> correctly. I finally got "way" over my head and built my own
> toolchain with crosstool-ng. Personally I would prefer to use a
> prebuilt external toolchain but at least everything works now.

Just a note to let you know that even though I didn't had the time the
past weeks to work on this, supporting Codesourcery toolchains in
Buildroot is definitely on my TODO-list. So, sorry if it wasn't ready
for your project, but it's for sure something I'd like to see supported
in Buildroot.

Thanks for all your investigations. When I'll have a little more time,
they will be very precious to give an idea where to start.

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
