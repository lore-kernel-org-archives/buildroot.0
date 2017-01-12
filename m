From: =?UTF-8?Q?Micha=c3=abl_Zweers?= <admin@gigabyte.getmyip.com>
Date: Thu, 12 Jan 2017 16:14:45 +0100
Subject: [Buildroot] orange-pi build not working
In-Reply-To: <CACXmViYRiyOME4qytV0puMhMewe1A-J-24MEnkPaVKh9-=C72g@mail.gmail.com>
References: <5876AA5C.2010904@sbcglobal.net> <87wpe1i4bv.fsf@dell.be.48ers.dk>
 <5876E124.30603@sbcglobal.net>
 <CACXmViYRiyOME4qytV0puMhMewe1A-J-24MEnkPaVKh9-=C72g@mail.gmail.com>
Message-ID: <959b39b2-b40e-4725-6ff7-44e26479e19a@gigabyte.getmyip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Sorry if this is unhelpful but have you told your kernel to use console ?

I can get the same results if  i dont set the console=... to uart in
boot argument on my imx7 board.

kind regards,
Micha?l


On 12-1-2017 09:36, Peter Korsgaard wrote:
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

---
This email has been checked for viruses by Avast antivirus software.
https://www.avast.com/antivirus
