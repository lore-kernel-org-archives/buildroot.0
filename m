From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Aug 2019 14:44:23 +0200
Subject: [Buildroot] Buildroot ts7680_defconfig no longer builds
In-Reply-To: <20190810104751.647f64ed@windsurf.home>
References: <20190810104751.647f64ed@windsurf.home>
Message-ID: <20190818144423.003b5a80@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Julien,

On Sat, 10 Aug 2019 10:47:51 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> The ts7680_defconfig in Buildroot no longer builds:
> 
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/269139303

It still fails to build:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/273673278

Will you have the chance to look into this? Otherwise we can simply
remove the defconfig.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
