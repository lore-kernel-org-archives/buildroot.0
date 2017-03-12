From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Mar 2017 14:35:06 +0100
Subject: [Buildroot] [PATCH 0/4] package/nbd: fixes and bump
In-Reply-To: <20170312142915.27e2025b@free-electrons.com>
References: <cover.1489312674.git.yann.morin.1998@free.fr>
 <20170312142915.27e2025b@free-electrons.com>
Message-ID: <20170312133506.GB3739@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Peter, All,

On 2017-03-12 14:29 +0100, Thomas Petazzoni spake thusly:
> On Sun, 12 Mar 2017 10:58:15 +0100, Yann E. MORIN wrote:
> > Yann E. MORIN (4):
> >       package/nbd: rename options
> >       package/nbd: fix utilities locations
> >       package/nbd: add option for the trdump utility
> >       package/nbd: bump version
> 
> Applied, thanks!
> 
> Peter: I believe we want to apply PATCH 2/4 to the LTS branch. However,
> it will conflict a bit because Yann did the renaming of options before
> the fix, but the conflicts should be trivial to resolve.

Hmm... To me, both were fixes, so I did not think that the order would
be important.

But now I see that I should have thought about what could be backported,
and clearly only 2/4 should, so it should have been the first in the
series.

I;ll try to think about this in the future. Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
