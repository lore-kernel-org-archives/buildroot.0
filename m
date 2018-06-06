From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 6 Jun 2018 21:06:57 +0200
Subject: [Buildroot] [PATCH] libbsd: bump to version 0.9.1
In-Reply-To: <20180606075802.3f397dd9@windsurf>
References: <f54e614d6b4a1de2ab39e843ed6266828faecd15.1528222775.git.baruch@tkos.co.il>
 <20180605221634.3a53fa0b@windsurf>
 <20180606040131.drvicwte22lzicad@sapphire.tkos.co.il>
 <20180606075802.3f397dd9@windsurf>
Message-ID: <20180606190657.GB2537@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Baruch, All,

On 2018-06-06 07:58 +0200, Thomas Petazzoni spake thusly:
> On Wed, 6 Jun 2018 07:01:31 +0300, Baruch Siach wrote:
[--SNIP--]
> > The actual effective line is 
> > rather shorter than what we have following this patch:
> > LICENSE = "BSD-4-Clause & ISC & PD"
> 
> I also think it is good enough. But I wanted to point out that the
> licensing is in fact a bit more complicated. I personally don't see the
> need of having a more detailed LIBBSD_LICENSE description, but I wanted
> to point this out so that others can comment on this (Arnout, Yann,
> Peter).

From https://libbsd.freedesktop.org/wiki/ :

   "Most of the licenses are either ISC, MIT, Beerware, BSD-2-clause,
   BSD-3-clause, and BSD-4-clause [...]"

So, we should probably at least list just those:

    LIBBSD_LICENSE = ISC, MIT, Beerware, BSD-2-clause, BSD-3-clause, BSD-4-clause

My $0.02...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
