From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 25 Dec 2017 14:29:17 +0200
Subject: [Buildroot] [PATCH] package/mfgtools: bump to 0.02
In-Reply-To: <dfec903f-ffef-d840-62f4-39f0dabcdd8c@gmail.com>
References: <20171224102029.17178-1-romain.naour@gmail.com>
 <20171224161029.smqyft5nh2ec23mt@sapphire.tkos.co.il>
 <dfec903f-ffef-d840-62f4-39f0dabcdd8c@gmail.com>
Message-ID: <20171225122917.q4js4bmakw2gcjei@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

On Mon, Dec 25, 2017 at 01:14:47PM +0100, Romain Naour wrote:
> Le 24/12/2017 ? 17:10, Baruch Siach a ?crit?:
> > On Sun, Dec 24, 2017 at 11:20:29AM +0100, Romain Naour wrote:

[...]

> >>  MFGTOOLS_SUBDIR = MfgToolLib
> >>  MFGTOOLS_LICENSE = BSD-3-Clause or CPOL
> > 
> > Should the license be updates as well with the removal of COPL?
> 
> The CPOL file was removed but the CPOL license is still valid.

Thanks for clarifying.

> See the Readme file from this version:
> 
> Licenses:
> - CPOL: MfgToolLib/XmlLite.CPP and XmlLite.h
> - BSD: Others.
> 
> I hesitated to add these files in MFGTOOLS_LICENSE_FILES since their content
> (hash) are likely to be modified between each version.
> 
> Thoughts?

I think that README.txt should be listed in _LICENSE_FILES.

> >> -MFGTOOLS_LICENSE_FILES = LICENSE CPOL.htm
> >> +MFGTOOLS_LICENSE_FILES = LICENSE
> >>  HOST_MFGTOOLS_DEPENDENCIES = host-libusb
> >>  
> >>  HOST_MFGTOOLS_CFLAGS = \

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
