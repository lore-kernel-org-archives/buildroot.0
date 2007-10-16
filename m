From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 16 Oct 2007 07:36:32 +0200
Subject: [Buildroot] AVR32 4.1.2 toolchain build issues [was
	svncommit:trunk/buildroot: target/device target/device/Atmel
	targetetc...]
References: <d6cda7730710140720r55bd9903s5001f0b864fe9952@mail.gmail.com>
	<02c301c80f72$254d2400$01c4af0a@Glamdring>
	<20071015221718.GA15524@reid1.localdomain>
	<059501c80f79$dd1305d0$01c4af0a@Glamdring>
	<20071015234955.GA18119@reid1.localdomain>
	<d6cda7730710151846n722419d9t806cea6018d1b54d@mail.gmail.com>
Message-ID: <004d01c80fb7$220ba740$01c4af0a@Glamdring>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Ok.... got it to build... it happens to be that atngw100_defconfig now
> builds to a dir without nofp sufix, which makes me wonder if ppl have
> decided weather this thing has or doesn't has an FP, perhaps it's a
> paradox, or a dogma. You just have to belive it works. *smile*
>
> Anyway, disabled libdaemon, which I never use anyway, and now I get
> the uboot issue as well.... but at least I can work now. It should be
> easily enough to pull uboot from the Atmel AVR32 fork and figure out
> what's wrong. Dealing with packages is so much easier.
>
> Btw, is there a reason why u-boot is buried into Atmel folder?
> Shouldn't other archs/chips use it as well?
>

It is not the mainstream U-Boot tree.
It is a prepatched U-boot to support the AT91 series and should support the 
AVR32 as well.
The AVR32 Buildroot at www.atmel.no/buildroot is a more up to date version 
though,



Best Regards
Ulf Samuelsson                ulf at atmel.com
Atmel Nordic AB
Mail:  Box 2033, 174 02 Sundbyberg, Sweden
Visit:  Kavalleriv?gen 24, 174 58 Sundbyberg, Sweden
Phone +46 (8) 441 54 22     Fax +46 (8) 441 54 29
GSM    +46 (706) 22 44 57

Technical support when I am not available:
AT89 C51 Applications Group: mailto:micro.hotline at nto.atmel.com
AT90 AVR Applications Group: mailto:avr at atmel.com
AT91 ARM Applications Group: mailto:at91support at atmel.com
FPSLIC Application Group: mailto:fpslic at atmel.com Best AVR
link: www.avrfreaks.net 
