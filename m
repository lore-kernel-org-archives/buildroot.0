From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 13 Feb 2021 11:19:39 +0100
Subject: [Buildroot] [PATCH-NEXT 2/4] package/linux-firmware.mk: get rid
 of temporary tarball for file installation
In-Reply-To: <871rdke0kx.fsf@dell.be.48ers.dk>
References: <20210212184049.13202-1-peter@korsgaard.com>
 <20210212184049.13202-3-peter@korsgaard.com>
 <20210212203939.GK1679218@scaer> <87blcpezmw.fsf@dell.be.48ers.dk>
 <20210213083705.GO1679218@scaer> <875z2we1uy.fsf@dell.be.48ers.dk>
 <20210213095154.GP1679218@scaer> <871rdke0kx.fsf@dell.be.48ers.dk>
Message-ID: <20210213101939.GS1679218@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2021-02-13 11:14 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>  >> >> Ok, so we need to stick a set -o pipefail before?
>  >> > I prefer if we could cleanup the install sequence, as I suggested and
>  >> > proposed in another reply.
>  >> Well, having our temporary tarball in the build directory is also kind
>  >> of ugly, but ok - Fine by me.
>  > That will not be worse than now: we already leave the temporary tarball
>  > in the build directory...
> Yes, I know - Which was part of the reason for me wanting to change
> it. But oh well, it is not a big deal.

Ah, sorry, I miss-read that part, then...

But as I said in the commit log of that proposal of mine, I don't see
how we can do it easily without a tarball... But if you think of a
better alternative, I'm all ears^Weyes. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
