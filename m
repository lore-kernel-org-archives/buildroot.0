From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 10 Feb 2021 21:39:32 +0100
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 5.{4,
 10}.x 4.{4, 9, 14, 19} series
In-Reply-To: <87sg6844vt.fsf@dell.be.48ers.dk>
References: <20210206115319.1442990-1-bernd.kuhls@t-online.de>
 <87sg6844vt.fsf@dell.be.48ers.dk>
Message-ID: <20210210203932.GC1679218@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, Peter, All,

On 2021-02-07 10:13 +0100, Peter Korsgaard spake thusly:
> >>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:
>  > Please note that the bump of kernel 4.4 and 4.9 to 4.x.256 can cause
>  > problems:
>  > https://lkml.org/lkml/2021/2/5/747
>  > https://lkml.org/lkml/2021/2/5/862
> Given the risk of issues and how close we are to 2021.02-rc1, I decided
> to stick to 4.{4,9}.255 instead.

.257 of both series has now been released, which clamp the version to
.255 internally, so it should now be safe to bump to .257

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
