From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 18:22:22 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/cairo: add optional support
 for lzo
In-Reply-To: <1456066049-28163-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456066049-28163-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160221182222.41cec685@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 21 Feb 2016 15:47:29 +0100, Bernd Kuhls wrote:
> When lzo was compiled before, cairo will use it as optional dependency:
> 
> $ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/bin/cairo-sphinx | grep NEEDED | sort
> [...]
>  0x0000000000000001 (NEEDED)             Shared library: [liblzo2.so.2]
> 
> The build system offers no option to en-/disable lzo support:
> https://cgit.freedesktop.org/cairo/tree/configure.ac#n54
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: moved lzo outside BR2_PACKAGE_CAIRO_TEE option (Arnout)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
