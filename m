From: Arnar Mar Sig <antab@valka.is>
Date: Tue, 6 May 2008 09:19:05 +0000
Subject: [Buildroot] Ulf, you broke AVR32, why?
In-Reply-To: <013a01c8aef9$5aa98d10$070514ac@atmel.com>
References: <d6cda7730805051134j245a8687o66eaa6fc9d3c93ae@mail.gmail.com>
	<013a01c8aef9$5aa98d10$070514ac@atmel.com>
Message-ID: <75DA8A60-EC04-485B-AA62-BE88EF164D53@valka.is>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ulf,

You talk about us AVR32 people breaking packages, not testing our  
changes and demanding that we take our effort at maintaining packages  
and arch support to a separate tree. But still you do all off thous  
things, breaking packages, removing needed arch patches, not testing  
your changes and generally fucking up everything except AT91 support,  
WHY?

In my opinion, Buildroot is a collection of PATCHES to make cross- 
compiling easier, not to create some broken package system that i have  
to download every source and patch myself and patch by hand.

My 10cent in the penis fight.
	Arnar Mar Sig.


On May 5, 2008, at 9:41 PM, Ulf Samuelsson wrote:

>> You removed something that was working in favor of something that is
>> not for no reason.
>
> The Atmel patches adds way too much bloat to the svn.
> That is why the external toolchain was added.
> Also, IIRC some patches broke other architectures.
>
>> On top of that, external toolchain tries to download prepatched
>> toochain from a site that you control, but that has no such files to
>> download from.
>
> BR2_ATMEL_MIRROR should be ftp://www.at91.com/pub/buildroot/
> I see the files in this location.
>
>> For some Godly unknown reason, there was no commit message on the  
>> mailling list.
>>
>> Please revert your changes asap.
>>
>
> No, if there are problems, it should be fixed within the external  
> toolchain
> to avoid adding those megabytes, which are of no interest to AVR32  
> users.
> There are hooks to patch the external toolchain if neccessary.
>
>
> Best Regards
> Ulf Samuelsson                ulf at atmel.com
> Atmel Nordic AB
> Mail:  Box 2033, 174 02 Sundbyberg, Sweden
> Visit:  Kavalleriv?gen 24, 174 58 Sundbyberg, Sweden
> Phone +46 (8) 441 54 22     Fax +46 (8) 441 54 29
> GSM    +46 (706) 22 44 57
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
