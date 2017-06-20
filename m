From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Jun 2017 07:47:24 +0200
Subject: [Buildroot] [PATCH v4 2/6] board: engicam: Rename defconfig
 engicam_imx6qdl_icore_mmc_defconfig
In-Reply-To: <CAMty3ZC-u57FFXdjWwrbp6Hrw-rHTD9NLUQHp+igGmF4EGDfOA@mail.gmail.com>
References: <1497857252-8308-1-git-send-email-jteki@openedev.com>
 <1497857252-8308-3-git-send-email-jteki@openedev.com>
 <20170619221927.0986c336@windsurf.home>
 <CAMty3ZC-u57FFXdjWwrbp6Hrw-rHTD9NLUQHp+igGmF4EGDfOA@mail.gmail.com>
Message-ID: <20170620074724.69d30ccb@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 20 Jun 2017 08:00:04 +0530, Jagan Teki wrote:

> > Unless we are going to introduce other configurations for the same
> > board (to support NAND booting), then I would prefer to keep the name
> > without the "mmc". The readme.txt can explain that the configuration
> > supports MMC booting.  
> 
> I see a point where these defconfig names is in-line with U-Boot
> defconfig - since like U-Boot have defconfig based on boot-modes
> buildroot have similar approach.

There is no special reason to have the Buildroot defconfig name match
1:1 the U-Boot name, so please drop the _mmc_ part of the Buildroot
defconfig names.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
