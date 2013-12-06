From: Thomas Pedersen <thomas@cozybit.com>
Date: Fri, 6 Dec 2013 12:48:04 -0800
Subject: [Buildroot] [PATCH v2] pandaboard: fix defconf build with
	recent kernels
In-Reply-To: <1386362806-16798-1-git-send-email-thomas@cozybit.com>
References: <1386362806-16798-1-git-send-email-thomas@cozybit.com>
Message-ID: <CAG6hwVPpj2vfhzSog9AkY=OjJBsuWTKYduWmNGWrO2hQktQS=g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Dec 6, 2013 at 12:46 PM, Thomas Pedersen <thomas@cozybit.com> wrote:
> The patch "pandaboard: Fix defconfig build" locked the
> default pandaboard kernel to 3.8.11. This is inconvenient,
> since the boot process has changed since kernel > 3.8.
>
> Update the default kernel to 3.12.2 and fix the boot image
> configuration, but remain compatible with legacy U-Boot
> versions by using appended flattened device tree uImage.

Tested as booting fine with kernel 3.12.2 and U-Boot 2012.07 :)

Thanks,
Thomas
