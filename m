From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Thu, 16 Apr 2009 21:18:48 -0300
Subject: [Buildroot] A new QTOPIA error
In-Reply-To: <26fbce020904161703p4c5d48c4l136a77055d8a68b4@mail.gmail.com>
References: <26fbce020904141244l627cf9a8udc8af0cc80af2148@mail.gmail.com>
	<26fbce020904161302x7e94966bsa77c2981c308908a@mail.gmail.com>
	<d6cda7730904161602o50047f0ei1fea9c0dc51b26f0@mail.gmail.com>
	<26fbce020904161703p4c5d48c4l136a77055d8a68b4@mail.gmail.com>
Message-ID: <d6cda7730904161718q61ae7440vd40e589f0aea8a6@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yes, I did the commit for the 4.4.3 update :)

The LGPL license new in 4.5.0 probably is what will enable most people
to use Qt Embedded. Btw, Peter probably also has Qt 4.5.0 working as
well (he uses x86 and ARM AFAIK), since he updated the sed part of the
makefiles after the 4.5.0 change.

BR,
   Thiago A. Correa

On Thu, Apr 16, 2009 at 9:03 PM, Luciano Greiner
<luciano.greiner@gmail.com> wrote:
> Are you building 4.5.0 version yet?
>
> Thanks
>
> 2009/4/16 Thiago A. Corr?a <thiago.correa@gmail.com>:
>> Hi,
>>
>>
>> On Thu, Apr 16, 2009 at 5:02 PM, Luciano Greiner
>> <luciano.greiner@gmail.com> wrote:
>>> Nobody but me with QTOPIA compilation errors? I tryed to change host 3
>>> times, and the same happens.
>>>
>>
>> ? I'm sorry to say, but I guess yeah. It builds and works quite
>> nicely on AVR32 target, built from a Gentoo host. The only part that I
>> know isn't working is xmlpatterns module because it crashes the AVR32
>> toolchain, but that's a problem with Atmel's patches, plus, it's not
>> even enabled by default.
>>
>> ?If you could post your .config, I can give it a try here.
>>
>> Kind Regards,
>> ? Thiago A. Correa
>>
>
>
>
> --
> Luciano Greiner
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
