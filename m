From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 12:28:00 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/vim: add optional support
 for gpm
In-Reply-To: <1456036379-10200-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456036379-10200-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160221122800.75b21995@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 21 Feb 2016 07:32:59 +0100, Bernd Kuhls wrote:
> When gpm was compiled before, vim will use it as optional dependency:
> 
> $ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/bin/vim | grep NEEDED | sort
>  0x0000000000000001 (NEEDED)             Shared library: [libacl.so.1]
>  0x0000000000000001 (NEEDED)             Shared library: [libc.so.1]
>  0x0000000000000001 (NEEDED)             Shared library: [libdl.so.1]
>  0x0000000000000001 (NEEDED)             Shared library: [libgpm.so.2]
>  0x0000000000000001 (NEEDED)             Shared library: [libintl.so.8]
>  0x0000000000000001 (NEEDED)             Shared library: [libm.so.1]
>  0x0000000000000001 (NEEDED)             Shared library: [libncurses.so.5]
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: fixed typos gmp -> gpm (Ricardo)

Applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
