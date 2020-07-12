From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jul 2020 10:28:36 +0200
Subject: [Buildroot] [PATCH v3 1/4] package/freescale-imx: Move DDR FW
 choice down to firmware-imx package
In-Reply-To: <20200712061011.GA18825@scaer>
References: <1594382445-4464-1-git-send-email-stephane.viau@oss.nxp.com>
 <1594382445-4464-2-git-send-email-stephane.viau@oss.nxp.com>
 <20200711224833.339c7f96@windsurf.home>
 <20200712061011.GA18825@scaer>
Message-ID: <20200712102836.05c13add@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 12 Jul 2020 08:10:11 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > When renaming options, we need to keep the old option name in
> > Config.in.legacy so that it doesn't get silently dropped when users
> > update to a newer Buildroot version.  
> 
> That was not necessary, because BR2_PACKAGE_FIRMWARE_DDRFW_LPDDR4 was
> only introduced after 2020.05, so we have no release with the symbol.

Gah, indeed, I missed that. I fixed it up in a follow-up commit. Thanks
for noticing!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
