From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 27 May 2018 18:14:40 +0200
Subject: [Buildroot] [PATCH 0/2] package/binutils+elf2flt: fix for noMMU
 targets
In-Reply-To: <20180527153510.GB2965@scaer>
References: <cover.1527280948.git.yann.morin.1998@free.fr>
 <db85fdbc-8767-4ada-bdab-872202ee5ce2@mind.be>
 <20180527153510.GB2965@scaer>
Message-ID: <20180527161440.GC2965@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, all,

On 2018-05-27 17:35 +0200, Yann E. MORIN spake thusly:
> On 2018-05-27 16:34 +0200, Arnout Vandecappelle spake thusly:
> >  So maybe, instead of laying hacks upon hacks, we should go back to the drawing
> > board on the rpath handling? I would feel a lot more comfortable if we could
> > just fix fix-rpath instead of playing the whack-a-mole game of workarounds in
> > packages.
[--SNIP--]
> Or were you suggesting that we do not add infra, but we replace the
> current two hacks (Thomas' symlinks or my script wrappers) by an actual
> copy, still just for binutils and elf2flt? In which case we would not
> loose time detecting hard-links in a generic way, obviously.

Something like the following, maybe?
    https://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/binutils-elf2flt-fix-2

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
