From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 15 Jan 2018 21:31:50 +0100
Subject: [Buildroot] [PATCH 2/3] linux-firmware: fix install for Chelsio
 T[45]
In-Reply-To: <87o9luubm0.fsf@dell.be.48ers.dk>
References: <1515973281-3997-1-git-send-email-ricardo.martincoski@gmail.com>
 <1515973281-3997-2-git-send-email-ricardo.martincoski@gmail.com>
 <20180115165743.GB2533@scaer> <87o9luubm0.fsf@dell.be.48ers.dk>
Message-ID: <20180115203150.GC11122@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2018-01-15 21:10 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  > Ricardo, All,
>  > On 2018-01-14 21:41 -0200, Ricardo Martincoski spake thusly:
>  >> It's broken for the last 3 version bumps, since
>  >> 1c9846ecc9 "linux-firmware: Bump to the latest version"
>  >> 
>  >> Fix it by updating the name of the file to install.
>  >> Do not use * since it would install also old versions that would take
>  >> 1MB extra space in the target.
> 
>  > I would prefer if we were to keep installing the older version, because
>  > presumably older kernel versions (even if they request the unversionned
>  > t4fw.bin) would probably have been working with earlier versions of the
>  > firmware, so I'd prefer we leave to the user the option to redirect the
>  > symlink to the correct version they want to use.
> 
> That might indeed be nice, but should be done as a separate patch. A
> nice thing about install t4fw*bin would be that this kind of problems
> wouldn't happen again.

Good idea.

> Will you send a patch?

In the making now...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
