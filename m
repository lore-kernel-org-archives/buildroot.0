From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 4 Jan 2021 22:00:41 +0100
Subject: [Buildroot] [PATCH] boot/lpc32xxcdl: switch upstream location
In-Reply-To: <87r1n08wqv.fsf@dell.be.48ers.dk>
References: <20201229105653.3156279-1-yann.morin.1998@free.fr>
 <87r1n08wqv.fsf@dell.be.48ers.dk>
Message-ID: <20210104210040.GG1485369@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2021-01-04 17:58 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>  > The upstream git tree has disapeared, but a ZIP file is still hosted
>  > somewhere at NXP,. The content of that zip file has been verified to
>  > be 100% identical to the tarball we hosted on s.b.o.
[--SNIP--]
> Maybe we should just get rid of it? It is not referenced by any of our
> defconfigs.

Might as well drop it, if the lpc32xx stuff is indeed no longer useful.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
