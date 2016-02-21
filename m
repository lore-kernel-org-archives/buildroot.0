From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 18:29:47 +0100
Subject: [Buildroot] [PATCH 1/2] package/omniorb: add optional support
 for zlib
In-Reply-To: <1456067932-12447-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456067932-12447-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160221182947.551a17f9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 21 Feb 2016 16:18:51 +0100, Bernd Kuhls wrote:
> When zlib was compiled before, omniorb will use it as optional
> dependency:
> 
> $ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/lib/libomniZIOP4.so.2.0 | grep NEEDED
>  0x0000000000000001 (NEEDED)             Shared library: [libomniORB4.so.2]
>  0x0000000000000001 (NEEDED)             Shared library: [libomnithread.so.4]
>  0x0000000000000001 (NEEDED)             Shared library: [libpthread.so.1]
>  0x0000000000000001 (NEEDED)             Shared library: [libz.so.1]
> [...]
> 
> The build system offers no option to en-/disable libuuid support,

I guess you meant zlib, not libuuid.

> check acinclude.m4, line 435+.

Applied to master with the commit log fixed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
