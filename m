From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Mon, 5 Oct 2015 14:31:49 -0400
Subject: [Buildroot] [PATCH 1/1] wandboard_defconfig: bump u-boot to
 2015.07 and kernel to 3.14.28_1.0.0
In-Reply-To: <1443886802-23226-1-git-send-email-sergio.prado@e-labworks.com>
References: <1443886802-23226-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <20151005183149.GA10833@ketchup.mtl.sfl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Oct. Saturday 03 (40) 12:40 PM, Sergio Prado wrote:
> Bump U-boot version to 2015.07 from the mainline repository. Since there
> is SPL support for the wandboard in the U-boot 2015.07, it is now
> possible to boot the same U-boot image for all wandboard variants
> (solo/dual/quad).
> 
> Bump kernel version to 3.14.28_1.0.0 from the wandboard git repository.
> 
> Tested on Wandboard Solo, Wandboard Dual and Wandboard Quad.
> 
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>

Tested-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>

Tested on a WB-EDM-iMX6. Thanks Sergio!
