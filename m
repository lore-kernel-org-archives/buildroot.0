From: Hamish Moffatt <hamish@cloud.net.au>
Date: Tue, 16 Oct 2007 16:44:09 +1000
Subject: [Buildroot] buildroot for armeb, gcc-4.2.1 fails to build
In-Reply-To: <006b01c80fb9$f07efe40$01c4af0a@Glamdring>
References: <20071016055638.GA23927@cloud.net.au>
	<006b01c80fb9$f07efe40$01c4af0a@Glamdring>
Message-ID: <20071016064409.GA24904@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 16, 2007 at 08:00:07AM +0200, Ulf Samuelsson wrote:
>> And this is caused by soft-float.
>> Summary of situation:
>> arm EABI hard-float: builds.
>> armeb EABI hard-float: libgcc_s.so fails to link due to incorrect file
>> format of libc.so
>> arm/armeb OABI hard-float: builds.
>> arm/armeb OABI soft-float: fails as above (both endians fail the same
>> way).
>> I haven't tried soft-float EABI.
>
> I tried the ARM integrator, on Bernhards recommendation
> a few weeks ago, and that would build an EABI 4.2.1 softfloat toolchain,
> a few days later, it was broken again.
> I think that there must be some uClibc options which should be set
> in the correct way for the build to complete.

I just built arm + EABI + soft-float + 4.2.1 successfully.
I'm trying armeb now, although I'm not hopefully given that the same
configuration except for soft-float failed (with non-float-related
errors).

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
