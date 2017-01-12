From: paul <paul.arssov@sbcglobal.net>
Date: Thu, 12 Jan 2017 10:57:48 -0800
Subject: [Buildroot] orange-pi build not working
In-Reply-To: <CACXmViYRiyOME4qytV0puMhMewe1A-J-24MEnkPaVKh9-=C72g@mail.gmail.com>
References: <5876AA5C.2010904@sbcglobal.net> <87wpe1i4bv.fsf@dell.be.48ers.dk>
 <5876E124.30603@sbcglobal.net>
 <CACXmViYRiyOME4qytV0puMhMewe1A-J-24MEnkPaVKh9-=C72g@mail.gmail.com>
Message-ID: <5877D1AC.6060808@sbcglobal.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter ,

Regarding -
 > Funky, how are you powering the boards?
I use a cable - usb to power jack. This way is ok for powering and 
booting with  images from the oragngepi.org - ubuntu,debian...
The vendor of the boards recommends using 5v/2a power supply.
Just to be sure it is not a powering issue I did use 5v/2a adapter but 
the result is the same - stops after starting kernel.

Let me know the results of your test with orangepi .


Thanks, Paul.

On 1/12/2017 12:36 AM, Peter Korsgaard wrote:
> Hi,
>
> Please keep the buildroot list in CC so others can help as well.
>
>
>>> So no output at all after this? It sounds like your kernel image has
>>> somehow gotten corrupted. How did you reboot?
>>
>> I did multiple builds with 4.8 and 4.9 kernels - same result. The
>> original/initial kernel is not corrupted because it boots ok.
>> I did reboot by either -
>> # reboot
>> or, disconnect/connect power
>> While power off/on may corrupt the sd card, 'reboot' cmd should not.
>
> Funky, how are you powering the boards?
>
>> People did report on the list of functioning orange-pi-pc and orange-pi-one
>> boards.
>> How did they find the boards working?
>
> I do have an orangepi-pc board stacked away here, and it did work in
> the past. I'll try to find time this weekend to retest.
>
