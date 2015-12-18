From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 18 Dec 2015 19:50:30 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-12-17
In-Reply-To: <CANu7NGtPxDk0_hut1qD9nf3Xx-WtbhStzPfPZteLA3XQio+ztw@mail.gmail.com>
References: <20151218073022.58EAD102409@stock.ovh.net>
 <CANu7NGtPxDk0_hut1qD9nf3Xx-WtbhStzPfPZteLA3XQio+ztw@mail.gmail.com>
Message-ID: <20151218185030.GB27578@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sergio, All,

On 2015-12-18 08:32 -0200, Sergio Prado spake thusly:
> netbsd-queue package failed because it couldn't download the source from
> http://cvsweb.netbsd.org/.
> 
> http://autobuild.buildroot.net/results/b67/b67334da34901745a2fae5f202b9ae19fcaa7d12/build-end.log
> 

That was probably a transient error, since there has been no other
reported build failure due to netbsd-queue:

    http://autobuild.buildroot.org/?reason=netbsd-queue-1.70

> Since it is a critical package because every musl toolchain depends on it,
> should we put a copy in sources.buildroot.net?

Package that are successfully downloaded will automatically end up in our
mirror, don't worry.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
