From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 26 Dec 2012 06:51:36 +0200
Subject: [Buildroot] [PATCH] new package: libfribidi
In-Reply-To: <1356469718-20828-1-git-send-email-mikhailboiko85@gmail.com>
References: <1356469718-20828-1-git-send-email-mikhailboiko85@gmail.com>
Message-ID: <20121226045135.GA7402@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Mikhail,

On Tue, Dec 25, 2012 at 11:08:38PM +0200, Mikhail Boiko wrote:
[...]
> +LIBFRIBIDI_VERSION = 0.19.5
> +LIBFRIBIDI_SOURCE = fribidi-$(LIBFRIBIDI_VERSION).tar.bz2
> +LIBFRIBIDI_SITE = http://www.fribidi.org/download/
> +LIBFRIBIDI_LICENSE = GPLv2+
> +LIBFRIBIDI_LICENSE_FILES = COPYING

The COPYING contains the LGPLv2.1 text. In addition, the README file includes 
the "or later" language in its License section. So LIBFRIBIDI_LICENSE should 
be LGPLv2.1+

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
