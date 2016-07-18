From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Jul 2016 23:30:11 +0200
Subject: [Buildroot] [PATCH 1/6] package/busybox: add comment about
 BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
In-Reply-To: <ce037a071acb910af0b9b962885496169848718b.1468744792.git.yann.morin.1998@free.fr>
References: <cover.1468744792.git.yann.morin.1998@free.fr>
 <ce037a071acb910af0b9b962885496169848718b.1468744792.git.yann.morin.1998@free.fr>
Message-ID: <20160718233011.04779426@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 17 Jul 2016 10:44:23 +0200, Yann E. MORIN wrote:
> BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is a bit special. When Busybox is
> enabled, it is a Busybox option. When Busybox is not enabled, it is a
> stand-alone option, forcibly enabled.
> 
> So we can safely 'select' it without ensuring (via a 'depends on' or
> another 'select') that Busybox is enabled.
> 
> However, the name of this option does not express the fact that it is
> safe to select it without checking Busybox, which can lead to a bit of
> time-consuming head-scratching.
> 
> To avoid future puzzlement from an unsuspecting observer, adda a big fat
> comment that this option can be selected without any dependency on
> busybox.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Romain Naour <romain.naour@openwide.fr>

I've applied, after taking Romain's comment into account (except the
first one), and after tweaking a bit the last comment in the Config.in
file.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
