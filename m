From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 2 Jun 2020 23:14:57 +0200
Subject: [Buildroot] [PATCH] configs/rock64_defconfig: remove defconfig
In-Reply-To: <05f4af44-8cf5-989e-df94-df39b6d6bd8e@gmail.com>
References: <20200531143452.575717-1-romain.naour@gmail.com>
 <05f4af44-8cf5-989e-df94-df39b6d6bd8e@gmail.com>
Message-ID: <20200602231457.50033f15@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 1 Jun 2020 15:55:42 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> Actually this issue is not related to the uboot fork but the official 2017.09
> (and maybe previous releases)

So it feels like the solution is not really to remove that defconfig,
correct? Because any other defconfig using 2017.09 and libpyfdt (and
possibly some other nearby U-Boot versions) would also be affected,
correct ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
