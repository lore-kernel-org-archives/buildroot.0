From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 2 Jun 2014 20:41:42 +0200
Subject: [Buildroot] [PATCH 0/30 v11] xbmc: bump version to 13.1 (branch
 yem/bernd/xbmc-10)
In-Reply-To: <0bru5bx1ii.ln2@ID-313208.user.individual.net>
References: <cover.1401274944.git.yann.morin.1998@free.fr>
 <0bru5bx1ii.ln2@ID-313208.user.individual.net>
Message-ID: <20140602184142.GA3404@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-06-02 20:11 +0200, Bernd Kuhls spake thusly:
> Hi,
> 
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

Yes, just post your series when you think it is ready.

> > I'm a bit disapointed I did not find enough free time to test the x86 +
> > full-openGL side of the series, but the bump in itself is already a good
> > thing.
> 
> Rest assured, I am using this setup, based on uClibc, for more than nine 
> months now, and it (livetv with tvheadend, various video formats and streams, 
> Goom) works fine.

Would care also sharing the corresponding defconfig, please?

Maybe it would be nice to have such a defconfig to use as a demo, along
with the one for the RPi (which I have yet to submit.)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
