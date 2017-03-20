From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Mar 2017 22:21:52 +0100
Subject: [Buildroot] [PATCH 1/3] package/mesa3d: add lm-sensors optional
 dependency
In-Reply-To: <20170319205155.3333-1-romain.naour@gmail.com>
References: <20170319205155.3333-1-romain.naour@gmail.com>
Message-ID: <20170320222152.57782896@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 19 Mar 2017 21:51:53 +0100, Romain Naour wrote:
> radeon-pci-0008
> Adapter: PCI adapter
> temp1:        +56.0 C  (crit = +120.0 C, hyst = +90.0 C)
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mesa3d/mesa3d.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

All three applied, after fixing the bogus hash issue noticed by Bernd.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
