From: Bogdan Radulescu <bogdan_radulescu99@yahoo.com>
Date: Thu, 6 Dec 2012 08:10:12 -0800 (PST)
Subject: [Buildroot] elfutils and the perf userspace tool
In-Reply-To: <20121205163111.025fed52@skate>
References: <1354573207.60693.YahooMailNeo@web120305.mail.ne1.yahoo.com>
 <CAJ+oik2wb+izT2we-WcnK5cTEtzo-_jW46Q98UMm=XfbCSqAWA@mail.gmail.com>
 <1354608794.90144.YahooMailNeo@web120304.mail.ne1.yahoo.com>
 <50BE4D1C.3020702@petroprogram.com> <20121204204232.3e5b0ec9@skate>
 <1354720073.28172.YahooMailNeo@web120306.mail.ne1.yahoo.com>
 <20121205163111.025fed52@skate>
Message-ID: <1354810212.82454.YahooMailNeo@web120304.mail.ne1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,



----- Original Message -----
> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> To: Bogdan Radulescu <bogdan_radulescu99@yahoo.com>
> Cc: Stefan Fr?berg <stefan.froberg@petroprogram.com>; "buildroot at busybox.net" <buildroot@busybox.net>
> Sent: Wednesday, December 5, 2012 4:31 PM
> Subject: Re: [Buildroot] elfutils and the perf userspace tool
> 
> Dear Bogdan Radulescu,
> 
> On Wed, 5 Dec 2012 07:07:53 -0800 (PST), Bogdan Radulescu wrote:
>>  I had a look at the yoctoproject patches and they are a bit confusing
>>  to me. There are way to many patches. Some of them fix problems I
>>  don't have and are very old. I decided to go with Stefans suggestions
>>  and I could go further, but now I am stuck again. Yes, I am using
>>  uClibc. Do you guys have a suggestion for this:
>>  http://pastie.org/pastes/5484094/text
>> 
>>  I would really like to have perf in buildroot and this thing is in
>>  the way.
> 
> Did you notice that you can build perf without libelf, by passing
> NO_LIBELF=1 to perf's Makefile?
> 
> Thomas
> -- 
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
>

I noticed now that this is in the newer versions. I tried to build it without libelf even though it will be pretty crippled but still I didn't have any luck.
http://pastie.org/pastes/5489305/text

I tried with using 3.7-rc3. In 3.4.22 isn't patched for building without libelf.
On which version did you manage to build it for ARM?

Bogdan
