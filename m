From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Oct 2020 13:35:50 +0200
Subject: [Buildroot] [PATCH] configs/mx6cubox: bump U-Boot version
In-Reply-To: <20201013103750.666287-1-francois.perrad@gadz.org>
References: <20201013103750.666287-1-francois.perrad@gadz.org>
Message-ID: <20201013133550.40f0fb3f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 13 Oct 2020 12:37:50 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> now, the build requires host-swig
> which is given by BR2_TARGET_UBOOT_NEEDS_PYLIBFDT
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  configs/mx6cubox_defconfig | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
