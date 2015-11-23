From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Nov 2015 22:28:23 +0100
Subject: [Buildroot] [PATCH 50/51] arch/xtensa: accept the overlay to be
 an URL
In-Reply-To: <20151123213523.2668237d@free-electrons.com>
References: <cover.1448289515.git.yann.morin.1998@free.fr>
 <fb88a640d6ca2ceb85fc96fa73a960af848c8930.1448289515.git.yann.morin.1998@free.fr>
 <20151123213523.2668237d@free-electrons.com>
Message-ID: <20151123212823.GL3857@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-11-23 21:35 +0100, Thomas Petazzoni spake thusly:
> On Mon, 23 Nov 2015 15:48:20 +0100, Yann E. MORIN wrote:
> > +# No need for a conditional here, the variable will be enpty when
> > +# there is no URL to download.
> > +$(1)_EXTRA_DOWNLOADS += $$(ARCH_XTENSA_OVERLAY_URL)
> 
> If all EXTRA_DOWNLOADS files are saved as part of legal-info, then you
> can get rid of patches 38, 39 and 40.

And 37 too. But see my position on saving _EXTRA_DOWNLOADS (or
_ALL_DOWNLOADS for tha matters).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
