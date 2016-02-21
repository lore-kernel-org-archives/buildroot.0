From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 18:29:28 +0100
Subject: [Buildroot] [PATCH v2 1/4] package/sdl_sound: add optional
 support for libmodplug
In-Reply-To: <1456066610-32050-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456066610-32050-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160221182928.32e1e455@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 21 Feb 2016 15:56:47 +0100, Bernd Kuhls wrote:
> When libmodplug was compiled before, sdl_sound will use it as optional
> dependency:
> 
> $ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/lib/libSDL_sound-1.0.so.1.0.2 | grep NEEDED | sort
>  0x0000000000000001 (NEEDED)             Shared library: [libc.so.1]
>  0x0000000000000001 (NEEDED)             Shared library: [libdl.so.1]
>  0x0000000000000001 (NEEDED)             Shared library: [libmodplug.so.1]
> [...]
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: add --enable/disable-modplug (Thomas)

All four patches applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
