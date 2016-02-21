From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 21:26:57 +0100
Subject: [Buildroot] [PATCH 03/10] package/gnupg2: add optional support
 for libusb-compat
In-Reply-To: <1456076099-19607-3-git-send-email-bernd.kuhls@t-online.de>
References: <1456076099-19607-1-git-send-email-bernd.kuhls@t-online.de>
 <1456076099-19607-3-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160221212657.22e17c64@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 21 Feb 2016 18:34:52 +0100, Bernd Kuhls wrote:
> When libusb-compat was compiled before, gnupg2 will use it as optional
> dependency:
> 
> $ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/libexec/scdaemon | grep NEEDED
> [...]
>  0x0000000000000001 (NEEDED)             Shared library: [libusb-0.1.so.4]
> [...]
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/gnupg2/gnupg2.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
