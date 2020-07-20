From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Jul 2020 22:39:29 +0200
Subject: [Buildroot] [PATCH 3/8] boot/arm-trusted-firmware: bump to
 version 2.2
In-Reply-To: <20200719180727.28202-4-hi@senzilla.io>
References: <20200719180727.28202-1-hi@senzilla.io>
 <20200719180727.28202-4-hi@senzilla.io>
Message-ID: <20200720223929.61b2d24c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 19 Jul 2020 18:09:45 +0000
Dick Olsson <hi@senzilla.io> wrote:

> Release notes: https://trustedfirmware-a.readthedocs.io/en/latest/change-log.html#version-2-2
> Note that Buildroot testing has not yet been done with the latest version 2.3.
> 
> Signed-off-by: Dick Olsson <hi@senzilla.io>

Thanks, I've applied.

> diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.hash b/boot/arm-trusted-firmware/arm-trusted-firmware.hash
> index 394071865e..b98d1989f5 100644
> --- a/boot/arm-trusted-firmware/arm-trusted-firmware.hash
> +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.hash
> @@ -1,3 +1,4 @@
>  # Locally calculated
>  sha256 6dae02acd85278394bfad6e2683e186e5332a711e4491ac4632ad6480f6e5494 arm-trusted-firmware-v1.4.tar.gz

We don't keep the hashes of all versions, so I dropped this line, and
kept the new v2.2 line before the license file hash. Also, I took this
opportunity to fix the hash file spacing to follow our new convention.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
