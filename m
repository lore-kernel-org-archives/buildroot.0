From: Ulf Samuelsson <ulf@atmel.com>
Date: Fri, 31 Aug 2007 18:05:07 +0200
Subject: [Buildroot] mplayer-package doesn't build forotherarchitectures
	than avr32
References: <f90898420708290133i7ac1f31dkbdd53649945091b3@mail.gmail.com>
	<20070830221454.GG11697@aon.at>
	<014601c7eb5a$138e37e0$36f2780a@atmel.com>
	<20070831073156.GA29704@aon.at>
Message-ID: <00cb01c7ec06$cf9c3bb0$c6dc780a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>> Ulf, can you fix this up in a sane manner, i.e. not add ...$(ARCH).patch
>>> stuff but arch agnostic, universally working fixes, if any?
>>> 
>>> TIA,
>>>
>>
>>Got it from Hans Christian, which in his turn, got it from a colleague,
>>so they need to update it if that is to happen.
>>A lot of the stuff seems to be AVR32 specific in-line assembly code 
>>using the AVR32 DSP features to optimize the mplayer algorithms, 
>>so it seems utterly useless to apply for other architectures.
> 
> Given that mplayer currently is at 1.0-rc1 (i.e. not released), what
> about fixing this in the proper place, i.e. upstream?
> $ svn ls svn://svn.mplayerhq.hu/ffmpeg/trunk/libavcodec/ | grep -i avr
> $
> Turns up nothing..
>

I think it is the intention of the AVR32 team to ensure that all additions
they do are fed upstream, but I do not control their activities.


Best Regards
Ulf Samuelsson
