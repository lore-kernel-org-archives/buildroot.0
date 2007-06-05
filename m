From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 5 Jun 2007 10:26:06 +0200
Subject: [Buildroot] STILL soft float toolchain problems on ARM
In-Reply-To: <46651C38.4020200@gfplab.com>
References: <466505C9.6020007@gfplab.com> <20070605080539.GB30837@aon.at>
	<46651C38.4020200@gfplab.com>
Message-ID: <20070605082606.GC30837@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jun 05, 2007 at 10:18:00AM +0200, Paolo Scaffardi wrote:
>Bernhard Fischer ha scritto:
>> On Tue, Jun 05, 2007 at 08:42:17AM +0200, Paolo Scaffardi wrote:
>>> Hi there!
>>> I'm still trying to get a working buildroot for my ARM platform (EP9302
>>> cirrus logic CPU, T920), with soft float enabled. My configuration uses
>>> GCC 4.1.2, libfloat, soft float and uclibc 0.9.29 (i tried both
>>> snapshots and 0.9.29 official release).
>> 
>> I flagged several such reports with FLOAT in the subject. Can you
>> provide me with a kernel-config that i can use with qemu that does:
>> 1) use xscale (but t920 t926 should do too, if you prefer)
>> 2) have framebuffer support
>> 3) is noMMU
>> 4) wants soft-float
>
>I cannot provide such kernel config because i dont use XScale, but
>cirrus ep93xx. I dont understand why are you using QEMU to test these...

I'm using qemu because i don't have such hardware, that simple ;)

If i don't have a kernel that i can use for testing, i'm not
interrested, thanks.

>I'm simply trying to compile last buildroot snapshot WITHOUT changing
>any kernel configuration.

good luck
