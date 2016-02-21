From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 21:30:45 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/quagga: add optional support
 for libcap
In-Reply-To: <1456077645-25127-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456077645-25127-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160221213045.6dce2145@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 21 Feb 2016 19:00:45 +0100, Bernd Kuhls wrote:
> When libcap was compiled before, quagga will use it as optional
> dependency:
> 
> $ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/bin/vtysh | grep NEEDED | sort
>  0x0000000000000001 (NEEDED)             Shared library: [libcap.so.2]
> [...]
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: moved BR2_PACKAGE_LIBCAP code block (Thomas)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
