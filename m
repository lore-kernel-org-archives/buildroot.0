From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Nov 2016 23:00:39 +0100
Subject: [Buildroot] [PATCH] configs/mini2440_defconfig: remove defconfig
In-Reply-To: <1478355899-30146-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1478355899-30146-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20161106230039.118b56a8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  5 Nov 2016 15:24:59 +0100, Thomas Petazzoni wrote:
> This defconfig has not been updated in any significant way since 2011,
> when Peter moved it to use a mainline kernel. It's now using an
> ancient 3.0 kernel, and a vendor-specific U-Boot version that fails to
> build with various "undefined reference" errors:
> 
>   undefined reference to `show_boot_progress'
>   undefined reference to `image_print_contents'
>   undefined reference to `wait_ms'
> 
> So it's time to get rid of the defconfig for this platform.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> Of course, if anyone has access to this platform and is interested in
> having a defconfig in Buildroot, it's possible: just let us know, and
> send a patch updating the defconfig. Thanks!
> ---
>  configs/mini2440_defconfig | 34 ----------------------------------
>  1 file changed, 34 deletions(-)
>  delete mode 100644 configs/mini2440_defconfig

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
