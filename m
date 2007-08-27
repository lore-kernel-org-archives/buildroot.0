From: Jonathan Dumaresq <jdumaresq@cimeq.qc.ca>
Date: Mon, 27 Aug 2007 15:06:21 -0400
Subject: [Buildroot] buildroot for avr32
References: <00d401c7e655$5d036260$6e00a8c0@JONATHAN>
	<d6cda7730708240659q612e813l134c00d238ca6590@mail.gmail.com>
	<1188204128.7890.5.camel@localhost.localdomain>
Message-ID: <001001c7e8dd$5b177970$6e00a8c0@JONATHAN>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I would like to know how to customize the kernel when i build the buildroot
for avr32 ?

 make ARCH=avr32 CROSS_COMPILE=avr32-linux- menuconfig

under the linux folder don't seam to work.

Jonathan
----- Original Message ----- 
From: "Hans-Christian Egtvedt" <hcegtvedt@atmel.com>
To: "Thiago A. Corr?a" <thiago.correa@gmail.com>
Cc: "Jonathan Dumaresq" <jdumaresq@cimeq.qc.ca>; <buildroot@uclibc.org>
Sent: Monday, August 27, 2007 4:42 AM
Subject: Re: [Buildroot] buildroot for avr32


> On Fri, 2007-08-24 at 14:59 +0100, Thiago A. Corr?a wrote:
>>    I'm using the svn buildroot with avr32, and I'm running into my
>> fair share of issues, so I guess the Atmel snapshot might be a safer
>> bet. But I really don't like that they have removed the .svn folders
>> from the package, making it a lot harder to get updates from the
>> buildroot guys. Well, svn is catching up quite rapidly, and I have
>> been able to build what I needed so far. I have never built GTK+
>> thought.
>
> I plan to put out a GIT-repository somewhere soon. There will be an
> upstream branch with the snapshots from Buildroot and a master branch
> which will hold whatever extra changes that are done for AVR32. Very
> similar to how the Linux kernel for AVR32 is available.
>
> Making diffs should be very simple if you are custom with GIT.
>
>>    I have recently managed to merge the Atmel snapshot with svn to
>> some extent. But I haven't gone thru the resulting patch to sort out
>> what should be submitted and what should be discarded.
>
> The current Atmel snapshot is held at the current stage to get a stable
> base for the initial release. We try to put back the general changes
> upstream, and fiddle as little as possible away from upstream.
>
> -- 
> With kind regards,
> Hans-Christian Egtvedt, Applications Engineer
> 
