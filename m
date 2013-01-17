From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Thu, 17 Jan 2013 23:23:30 +0200
Subject: [Buildroot] RTLD_DEEPBIND and uClibc
In-Reply-To: <201301172217.46612.yann.morin.1998@free.fr>
References: <50F6A26D.4030607@petroprogram.com>
 <201301172138.34789.yann.morin.1998@free.fr>
 <50F8645E.2090600@petroprogram.com>
 <201301172217.46612.yann.morin.1998@free.fr>
Message-ID: <50F86BD2.1030703@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

17.1.2013 23:17, Yann E. MORIN kirjoitti:
> Stefan, All,
>
> On Thursday 17 January 2013 Stefan Fr?berg wrote:
>> 17.1.2013 22:38, Yann E. MORIN kirjoitti:
>>> What Thomas and I are saying, is that you gained about 1.5MiB on your
>>> 520MiB filesystem. That's about a 0.29% gain. Was that worth the hassle?
>>> (Beside learning, of course.)
>> My gentoo box with similar configuration is 1500 MB. So yeah I think it
>> was worth the hassle :-)
> No, you're not comparing comparable things.
>
> Of course, I can tell you that my Debian Squeeze is much bigger than my
> busybox-based router, but that's not the same thing.
Actually in my case it is. The only difference between my gentoo box and
buildroot version
is that gentoo uses bash and coreutils instead busybox.

> Rebuild your LiveCD with (e)glibc, and compare the sizes. Then you will
> notice that the size with eglibc is marginaly bigger than with uClibc.
> *That* is what we are saying.
>
> Regards,
> Yann E. MORIN.
>

And why I would want to make my system fatter again ? Hmmmh ???
Marginal or not

No, I will take my system as far as I can go with all the optimizations
I still have left and
then maybe start considering musl (Thanks Alex)

Regards
Stefan
