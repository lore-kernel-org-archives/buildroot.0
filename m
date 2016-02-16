From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Feb 2016 23:14:28 +0100
Subject: [Buildroot] [PATCH 1/1] package/gdb: add optional support for xz
In-Reply-To: <1455137950-18164-1-git-send-email-bernd.kuhls@t-online.de>
References: <1455137950-18164-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160216231428.190ba15b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Wed, 10 Feb 2016 21:59:08 +0100, Bernd Kuhls wrote:
> When xz was compiled before, gdb will use it as optional dependency:
> 
> $ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a output/target/usr/bin/gdb | grep NEEDED
>  0x00000001 (NEEDED)                     Shared library: [libdl.so.1]
>  0x00000001 (NEEDED)                     Shared library: [libncurses.so.5]
>  0x00000001 (NEEDED)                     Shared library: [libz.so.1]
>  0x00000001 (NEEDED)                     Shared library: [libm.so.1]
>  0x00000001 (NEEDED)                     Shared library: [liblzma.so.5]
>  0x00000001 (NEEDED)                     Shared library: [libc.so.1]
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/gdb/gdb.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
