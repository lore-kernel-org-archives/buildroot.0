From: Hans-Christian Egtvedt <hcegtvedt@norway.atmel.com>
Date: Mon, 30 Jul 2007 11:14:41 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
In-Reply-To: <20070730083914.GA22956@aon.at>
References: <20070729174350.EF22BA4508@busybox.net>
	<20070730072137.GB21479@aon.at>
	<1185781988.15219.2.camel@localhost.localdomain>
	<20070730083914.GA22956@aon.at>
Message-ID: <1185786881.9395.1.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Mon, 2007-07-30 at 10:39 +0200, Bernhard Fischer wrote:
> On Mon, Jul 30, 2007 at 09:53:08AM +0200, Hans-Christian Egtvedt wrote:
> >
> >On Mon, 2007-07-30 at 09:21 +0200, Bernhard Fischer wrote:
> >> On Sun, Jul 29, 2007 at 10:43:50AM -0700, ulf at uclibc.org wrote:

<cut AVR32 configuration menu option>

> >> I object to this change.
> >> Please explain why you don't just add disable-mudflap if the target arch
> >> is BR2_avr32
> >
> >So a little patch to alter the toolchain/gcc/Makefile.in to modify
> >EXTRA_TARGET_GCC_CONFIG_OPTIONS when ARCH is avr32 is a clean and nice
> >solution?
> >
> >And remove this stuff from Config.in.2?
> 
> exactly, yes.

Please see the included patch.

-- 
Mvh
Hans-Christian Egtvedt
-------------- next part --------------
A non-text attachment was scrubbed...
Name: simplify-avr32-gcc-configuration.patch
Type: text/x-patch
Size: 2185 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070730/f3d7bec5/attachment.bin 
