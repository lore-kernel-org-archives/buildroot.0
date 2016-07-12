From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 12 Jul 2016 22:49:12 +0200
Subject: [Buildroot] [PATCH 00/12 v8] Introduce libudev (branch
 yem/libudev-4)
In-Reply-To: <XnsA643E28C98875ID313208userindividu@bernd-kuhls.de>
References: <cover.1468274498.git.yann.morin.1998@free.fr>
 <XnsA643E28C98875ID313208userindividu@bernd-kuhls.de>
Message-ID: <20160712204912.GF3680@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

> [posted and mailed]

This is an annoyance: the way you reply means that messages arrive in
duplicate to me: one is directed at the list only (as To:) and the other
to me only (as To:). So when I replied to the personal reply, the list
was not in Cc:. This is annoying... :-/

What is the reason to use an NNTP client to handle a mailing list (i.e.
mails!) ? Can't you use a mail client instead?

Anyway, here is the message respun with the list in Cc: this time...

On 2016-07-12 22:16 +0200, Bernd Kuhls spake thusly:
> "Yann E. MORIN" <yann.morin.1998-GANU6spQydw@public.gmane.org> wrote
> > Not all packages that reference udev have been switched over to
> > depend
> > on libudev, though, since it is unclear to me whether they require a
> > udev daemon, or would be happy with just libudev. This can be done
> > in
> > follow up patches once libudev is eventually in the tree (for good
> > this
> > time I hope! ;-) )
> great to see the libudev patch series revived :)

Yeah, I was getting quite fed up with carrying this series and rebasing
it over and over again for the past two years or so... ;-)

Not that this is my oldest series, either! :-/

> I included your patch series in my buildroot repo and added four
> patches
> for libdrm, mesa3d, kodi and libcec, they do not need a udev daemon
[--SNIP--]
> Feel free to pick them up to your patch series if you like.

Well, rather than accumulate patches in this series, I'd rather we focus
on the core of it: building a stand-alone libudev.

I only included two converted packages in this series, as an example of
what it could be used as: a package that selects it and a package that
optionally depends on it.

Once libudev is in the tree, then we can look at converting more
packages.

> On my kodi17 branch you will find the patches from the libudev branch
> as well
> https://github.com/bkuhls/buildroot/commits/kodi17

Oh, so you already have been testing this series, then?

Would you care doing a review of it, possibly even just "tested-by" tags
would be a good indication that they work in your case too, so that the
maintainers have more confidence in it, that it is useful.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
