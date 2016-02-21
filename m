From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 14:51:44 +0100
Subject: [Buildroot] [PATCH 4/7] package/libfm: add optional support for
 libexif
In-Reply-To: <1456051888-2047-4-git-send-email-bernd.kuhls@t-online.de>
References: <1456051888-2047-1-git-send-email-bernd.kuhls@t-online.de>
 <1456051888-2047-4-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160221145144.3bee2059@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 21 Feb 2016 11:51:25 +0100, Bernd Kuhls wrote:
> When libexif was compiled before, libfm will use it as optional
> dependency:
> 
> $ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/lib/libfm.so.4.0.3 | grep NEEDED | sort
>  0x0000000000000001 (NEEDED)             Shared library: [libc.so.1]
>  0x0000000000000001 (NEEDED)             Shared library: [libdl.so.1]
>  0x0000000000000001 (NEEDED)             Shared library: [libexif.so.12]
> [...]
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libfm/libfm.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
