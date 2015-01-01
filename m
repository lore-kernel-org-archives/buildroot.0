From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 1 Jan 2015 06:36:37 +0200
Subject: [Buildroot] Building rt5370sta in Buildroot
In-Reply-To: <455AAA31-D2D2-47AD-81F0-1BD2F70AEDB3@nexsense.com>
References: <455AAA31-D2D2-47AD-81F0-1BD2F70AEDB3@nexsense.com>
Message-ID: <20150101043637.GJ16594@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi David,

On Thu, Jan 01, 2015 at 03:34:38AM +0000, David Lind wrote:
> I?m trying to build the Ralink rt5370sta driver in Buildroot. Has any done 
> this successfully and would be willing to divulge your .mk and Config.in 
> files?
> I?m getting the driver source from https://github.com/alangalvino/rt5370sta

Have you tried the mainline kernel rt2x00 driver? Just enable 
CONFIG_RT2800USB_RT53XX in any reasonably recent kernel.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
