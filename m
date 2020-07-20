From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 20 Jul 2020 21:12:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/python3: bump version to 3.8.4
In-Reply-To: <XnsAC00D6B63C92DberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <20200720171241.882043-1-aduskett@gmail.com>
 <XnsAC00D6B63C92DberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <20200720191254.GB2296@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, Adam, All,

On 2020-07-20 21:06 +0200, Bernd Kuhls spake thusly:
> aduskett at gmail.com wrote in 
> news:20200720171241.882043-1-aduskett at gmail.com:
> 
> > From: Adam Duskett <Aduskett@gmail.com>
> > 
> > Signed-off-by: Adam Duskett <Aduskett-
> Re5JQEeQqe8AvxtiuMwx3w at public.gmane.org>
> > ---
> >  package/python3/python3.hash | 6 +++---
> >  package/python3/python3.mk   | 2 +-
> >  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> Hi Adam
> 
> python 3.8.4 fixes CVE-2020-15523:
> https://docs.python.org/release/3.8.4/whatsnew/changelog.html#python-3-8-4-
> final
> 
> And 3.8.5 was released today ;)
> https://docs.python.org/release/3.8.5/whatsnew/changelog.html#changelog
> 
> which fixes CVE-2020-15801 & CVE-2019-20907.

Damn, I just applied the 3.8.4 bump. Adam, new patch pending? ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
