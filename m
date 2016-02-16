From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Feb 2016 23:16:43 +0100
Subject: [Buildroot] [PATCH 1/1] package/mc: add optional support for
 libssh2
In-Reply-To: <1455139292-5849-1-git-send-email-bernd.kuhls@t-online.de>
References: <1455139292-5849-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160216231643.25fb0886@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Wed, 10 Feb 2016 22:21:32 +0100, Bernd Kuhls wrote:
> When libssh2 was compiled before, mc will use it as optional dependency:
> 
> $ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a output/target/usr/bin/mc | grep NEEDED
>  0x00000001 (NEEDED)                     Shared library: [libncurses.so.5]
>  0x00000001 (NEEDED)                     Shared library: [libssh2.so.1]
>  0x00000001 (NEEDED)                     Shared library: [libz.so.1]
>  0x00000001 (NEEDED)                     Shared library: [libgcrypt.so.20]
>  0x00000001 (NEEDED)                     Shared library: [libgpg-error.so.0]
>  0x00000001 (NEEDED)                     Shared library: [libglib-2.0.so.0]
>  0x00000001 (NEEDED)                     Shared library: [libpthread.so.1]
>  0x00000001 (NEEDED)                     Shared library: [libintl.so.8]
>  0x00000001 (NEEDED)                     Shared library: [libc.so.1]
>  0x00000001 (NEEDED)                     Shared library: [libiconv.so.2]
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mc/mc.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
