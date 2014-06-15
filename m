From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 15 Jun 2014 10:16:14 +0300
Subject: [Buildroot] [PATCH 1/2] wpa_supplicant: disable for avr32
In-Reply-To: <20140615085424.46c9a5b8@free-electrons.com>
References: <8a8b1c998ef9cf581c4e0b442da6f3e18e3c57bb.1402814913.git.baruch@tkos.co.il>
 <20140615085424.46c9a5b8@free-electrons.com>
Message-ID: <20140615071613.GA31459@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, Jun 15, 2014 at 08:54:24AM +0200, Thomas Petazzoni wrote:
> On Sun, 15 Jun 2014 09:48:32 +0300, Baruch Siach wrote:
> 
> >  config BR2_PACKAGE_WPA_SUPPLICANT
> >  	bool "wpa_supplicant"
> >  	help
> > +	depends on !BR2_avr32 # no epoll_create1
> 
> With this change, isn't the "depends on" thing part of the help text? I
> believe it should appear before the help section.

Of course. Will fix in v2.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
