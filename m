From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Jan 2017 09:36:06 +0100
Subject: [Buildroot] orange-pi build not working
In-Reply-To: <5876E124.30603@sbcglobal.net>
References: <5876AA5C.2010904@sbcglobal.net> <87wpe1i4bv.fsf@dell.be.48ers.dk>
 <5876E124.30603@sbcglobal.net>
Message-ID: <CACXmViYRiyOME4qytV0puMhMewe1A-J-24MEnkPaVKh9-=C72g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Please keep the buildroot list in CC so others can help as well.


>> So no output at all after this? It sounds like your kernel image has
>> somehow gotten corrupted. How did you reboot?
>
> I did multiple builds with 4.8 and 4.9 kernels - same result. The
> original/initial kernel is not corrupted because it boots ok.
> I did reboot by either -
> # reboot
> or, disconnect/connect power
> While power off/on may corrupt the sd card, 'reboot' cmd should not.

Funky, how are you powering the boards?

> People did report on the list of functioning orange-pi-pc and orange-pi-one
> boards.
> How did they find the boards working?

I do have an orangepi-pc board stacked away here, and it did work in
the past. I'll try to find time this weekend to retest.

-- 
Bye, Peter Korsgaard
