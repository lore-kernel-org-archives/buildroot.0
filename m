From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 16 Oct 2007 07:57:42 +0200
Subject: [Buildroot] AVR32 4.1.2 toolchain build
	issues[was	svncommit:trunk/buildroot:
	target/devicetarget/device/Atmel targetetc...]
References: <d6cda7730710140720r55bd9903s5001f0b864fe9952@mail.gmail.com><02c301c80f72$254d2400$01c4af0a@Glamdring><20071015221718.GA15524@reid1.localdomain><059501c80f79$dd1305d0$01c4af0a@Glamdring><20071015234955.GA18119@reid1.localdomain><d6cda7730710151846n722419d9t806cea6018d1b54d@mail.gmail.com>
	<1192511723.28237.2.camel@localhost.localdomain>
Message-ID: <006a01c80fb9$f07c8d40$01c4af0a@Glamdring>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> On Tue, 2007-10-16 at 02:46 +0100, Thiago A. Corr?a wrote:
>> Ok.... got it to build... it happens to be that atngw100_defconfig now
>> builds to a dir without nofp sufix, which makes me wonder if ppl have
>> decided weather this thing has or doesn't has an FP, perhaps it's a
>> paradox, or a dogma. You just have to belive it works. *smile*
>>
>
> It does not have an FPU, probably just a bad defconfig.
>

Why not add a  "depends on !AVR32" patch to uClibc    KConfig which disables 
the possibility to select the bad FPU option?
If an AVR32 with a FPU appears (wish, wish :-) then this option can be 
removed.

Best Regards
Ulf Samuelsson 
