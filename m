From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sat, 20 Jan 2007 18:34:09 +0100
Subject: [Buildroot]
	buildroot/toolchain_build_i686/binutils-2.16.91.0.7/bfd/doc/bfd.info:
	build error
In-Reply-To: <200701201410.06047.claus.klein@arcormail.de>
References: <200701192249.57232.claus.klein@arcormail.de>
	<200701201410.06047.claus.klein@arcormail.de>
Message-ID: <20070120173409.GB23354@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jan 20, 2007 at 02:10:05PM +0100, Claus Klein wrote:
>On Friday 19 January 2007 22:49, Claus Klein wrote:
>> Hi,
>> 
>> I got a Warning: `makeinfo' is missing on your system. 
>> 	and the make failed?
>> 
>> Is this a known problem?

Fix this upstream or just install texinfo.
>> 
>> Best Regards,
>> 
>> Claus
>
>I stop at this point!
>I'm not able to build any toolchain under OpenSuse 10.1 without `makeinfo'
>
>What is the stable toolchain combination today?
>I expected the 'make defconfig' would work.
>It seems not?

2.6.19.2 headers, current svn of busybox and uClibc with current
binutils and gcc-4.2 from today work for me to create i386 and x86_64
rootfs. I currently have no need for other arches but they are
_supposed_ to work, of course.
