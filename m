From: Haavard Skinnemoen <hskinnemoen@atmel.com>
Date: Thu, 12 Apr 2007 13:02:30 +0200
Subject: [Buildroot] BSP patch
In-Reply-To: <009801c77b74$6b3533a0$dcc4af0a@atmel.com>
References: <02a401c76c07$c75473c0$01c4af0a@Glamdring>
	<20070321224324.GD5468@aon.at>
	<02e801c76c0e$c9eec980$01c4af0a@Glamdring>
	<20070322132609.GA11410@aon.at>
	<017101c771ed$52dbe8c0$01c4af0a@Glamdring>
	<20070410121838.GA16751@aon.at>
	<009801c77b74$6b3533a0$dcc4af0a@atmel.com>
Message-ID: <20070412130230.6638d243@dhcp-252-105.norway.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 10 Apr 2007 15:22:38 +0200
"Ulf Samuelsson" <ulf@atmel.com> wrote:

> > avr32_gcc/toolchain_gcc_4.0.2_gcc-4.0.2-atmel.0.99.2.patch.patch
> > 4.0.2 is deprecated. The current stable release is 4.1.2, 4.0.4 was the
> > last release of 4.0 so far.  
> 
> I know, you told me before.
> And does not contain any AVR32 patches.
> Everyone using the AVR32 will have to live with the 4.0.1 release
> until the AVR32 team provides an updated compiler.
> The only viable alternative is to not provide AVR32 support at all in buildroot.

We're currently testing binutils-2.17 and gcc-4.1.2 on avr32. I'll let
you know when we're confident that it's working properly, but at least
binutils seems to be working fine (I haven't gotten around to test gcc
myself yet.)

In the long term, we want to get support for avr32 upstream, but it
will probably take a while before we get everything sorted out.

In the mean time, you might want to check out the patches I've put up
at http://avr32linux.org/twiki/bin/view/Main/DevelopmentTools for
binutils 2.17 and gcc 4.0.4. Those are the patches I used to generate
the filesystem I'm currently using on my test system (using buildroot.)

Haavard
