From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2016 15:51:22 +0100
Subject: [Buildroot] [PATCH v3 1/1] package/libarchive: add optional
 support for bzip2
In-Reply-To: <1455978594-6454-1-git-send-email-bernd.kuhls@t-online.de>
References: <1455978594-6454-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160220155122.634b5251@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 20 Feb 2016 15:29:54 +0100, Bernd Kuhls wrote:
> When bzip2 was compiled before, libarchive will use it as optional
> dependency:
> 
> $ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a output/target/usr/lib/libarchive.so.13.1.2 | grep NEEDED
>  0x00000001 (NEEDED)                     Shared library: [liblzma.so.5]
>  0x00000001 (NEEDED)                     Shared library: [libbz2.so.1.0]
>  0x00000001 (NEEDED)                     Shared library: [libz.so.1]
>  0x00000001 (NEEDED)                     Shared library: [libc.so.1]
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v3: Added --with-bz2lib (Thomas)
> v2: Added note why --with-bz2lib is not needed (Arnout)

Applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
