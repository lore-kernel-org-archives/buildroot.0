From: Bogdan Radulescu <bogdan_radulescu99@yahoo.com>
Date: Wed, 5 Dec 2012 07:07:53 -0800 (PST)
Subject: [Buildroot] elfutils and the perf userspace tool
In-Reply-To: <20121204204232.3e5b0ec9@skate>
References: <1354573207.60693.YahooMailNeo@web120305.mail.ne1.yahoo.com>
 <CAJ+oik2wb+izT2we-WcnK5cTEtzo-_jW46Q98UMm=XfbCSqAWA@mail.gmail.com>
 <1354608794.90144.YahooMailNeo@web120304.mail.ne1.yahoo.com>
 <50BE4D1C.3020702@petroprogram.com> <20121204204232.3e5b0ec9@skate>
Message-ID: <1354720073.28172.YahooMailNeo@web120306.mail.ne1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,




----- Original Message -----
> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> To: Stefan Fr?berg <stefan.froberg@petroprogram.com>
> Cc: Bogdan Radulescu <bogdan_radulescu99@yahoo.com>; buildroot at busybox.net
> Sent: Tuesday, December 4, 2012 8:42 PM
> Subject: Re: [Buildroot] elfutils and the perf userspace tool
> 
> Dear Stefan Fr?berg,
> 
> On Tue, 04 Dec 2012 21:21:00 +0200, Stefan Fr?berg wrote:
>>  And there was some other (uClibc related) stuff that needed patching
>>  too that I can't now
>>  remember
>> 
>>  All in all, elfutils belongs sadly to the software category:
>> 
>> ? "Im doing things my own way, Im using non-portable glibc stuff and
>>  I don't give a crab about portability. Nah-nah-naaa"
>> 
>>  :-(
> 
> Don't reinvent the wheel:
> 
> ? 
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-devtools/elfutils/elfutils/uclibc-support.patch
> 
> And possibly other patches in:
> 
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-devtools/elfutils/elfutils
> 
> Thomas
> -- 
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
>

First thanks for the reply.

I had a look at the yoctoproject patches and they are a bit confusing to me. There are way to many patches. Some of them fix problems I don't have and are very old.
I decided to go with Stefans suggestions and I could go further, but now I am stuck again. Yes, I am using uClibc.
Do you guys have a suggestion for this: http://pastie.org/pastes/5484094/text

I would really like to have perf in buildroot and this thing is in the way.

Regards,
Bogdan
