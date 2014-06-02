From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 3 Jun 2014 00:12:49 +0200
Subject: [Buildroot] [PATCH 0/30 v11] xbmc: bump version to 13.1 (branch
 yem/bernd/xbmc-10)
In-Reply-To: <0bru5bx1ii.ln2@ID-313208.user.individual.net>
References: <cover.1401274944.git.yann.morin.1998@free.fr>
 <0bru5bx1ii.ln2@ID-313208.user.individual.net>
Message-ID: <20140602221249.GF3404@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-06-02 20:11 +0200, Bernd Kuhls spake thusly:
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote in
> news:cover.1401274944.git.yann.morin.1998 at free.fr: 
> 
> > This is version 11 of the XBMC bump to Gotham, initiated by Bernd.
> > This version reorders the series so that we can quickly bump XBMC, to
> > keep an iso-functional setup (mostly: on the Raspberry Pi), then new
> > required packages and dependencies, to finally enable building XBMC
> > on a full-openGL capable system.
> 
> would you mind when I send v12, if necessary? I re-ordered my patches 
> according to your v11 and updated mesa3d to rc5. This alone does not justify 
> a v12 series, but no one knows when xbmc 13.1 is released ;)

To ease your retrieving the series, you can pull the branch from my git
tree:
    git://gitorious.org/buildroot/buildroot.git yem/bernd/xbmc-10

Or:
    git://ymorin.is-a-geek.org/buildroot yem/bernd/xbmc-10

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
