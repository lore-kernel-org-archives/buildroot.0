From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 3 Nov 2016 22:09:57 +0100
Subject: [Buildroot] [PATCH] boards: add FriendlyARM Nanopi NEO
In-Reply-To: <20161103210232.76trmtm3bc2jz27c@lukather>
References: <1478204278-9650-1-git-send-email-yann.morin.1998@free.fr>
 <20161103210232.76trmtm3bc2jz27c@lukather>
Message-ID: <20161103210957.GA4087@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

On 2016-11-03 22:02 +0100, Maxime Ripard spake thusly:
> On Thu, Nov 03, 2016 at 09:17:58PM +0100, Yann E. MORIN wrote:
> > The FriendlyARM Nanopi NEO is a 4x4cm? board with an Allwiner H3 SoC:
> >   - quad-core Cortex-A7 @1.2GHz
> >   - 256 or 512MiB of DDR
> >   - uSDCard as only storage option
> >   - 3x USB 2.0 host (one socket, two on expansion pin-holes)
> >   - 1x USB 2.0 OTG (also used as power source)
> >   - 10/100 etehrnet MAC
> >   - GPIOs, SPI, I2c...
> > 
> > Support for the Nanopi NEO in U-Boot and Linux is very recent, so much
> > so that we have to use an -rc tag for U-Boot and a special Linux tree.
> 
> I'm not sure why you need that custom tree, the DT is in 4.9 already.

Yup. But with 4.9-rc3, I had mmc corruption. With your tree and
sunxi-next, I don't have those. Not sure what hapenned...

I can re-check to be sure.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
