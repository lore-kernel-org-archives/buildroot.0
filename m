From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 22:22:34 +0100
Subject: [Buildroot] [PATCH 1/1] boot/uboot: allow to build u-boot.itb
 image
In-Reply-To: <20191203213622.29133-1-dariobin@libero.it>
References: <20191203213622.29133-1-dariobin@libero.it>
Message-ID: <20191208222234.256e87b9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  3 Dec 2019 22:36:22 +0100
Dario Binacchi <dariobin@libero.it> wrote:

> It allows you to add the u-boot.itb to the list of U-Boot images that
> can be created.
> Like the others, this one is also copied to the image folder.
> 
> Signed-off-by: Dario Binacchi <dariobin@libero.it>
> ---
>  boot/uboot/Config.in | 3 +++
>  boot/uboot/uboot.mk  | 5 +++++
>  2 files changed, 8 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
