From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 18:23:44 +0100
Subject: [Buildroot] [PATCH 3/7] package/chrony: add optional support
 for libcap
In-Reply-To: <1456066125-28379-3-git-send-email-bernd.kuhls@t-online.de>
References: <1456066125-28379-1-git-send-email-bernd.kuhls@t-online.de>
 <1456066125-28379-3-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160221182344.700ba2ab@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 21 Feb 2016 15:48:41 +0100, Bernd Kuhls wrote:
> When libcap was compiled before, chrony will use it as optional
> dependency:
> 
> $ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/sbin/chronyd | grep NEEDED
>  0x0000000000000001 (NEEDED)             Shared library: [libm.so.1]
>  0x0000000000000001 (NEEDED)             Shared library: [libcap.so.2]
>  0x0000000000000001 (NEEDED)             Shared library: [libpthread.so.1]
>  0x0000000000000001 (NEEDED)             Shared library: [libc.so.1]
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/chrony/chrony.mk | 6 ++++++
>  1 file changed, 6 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
