From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 18:23:47 +0100
Subject: [Buildroot] [PATCH 4/7] package/kismet: add optional support
 for libcap
In-Reply-To: <1456066125-28379-4-git-send-email-bernd.kuhls@t-online.de>
References: <1456066125-28379-1-git-send-email-bernd.kuhls@t-online.de>
 <1456066125-28379-4-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160221182347.54b77eab@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 21 Feb 2016 15:48:42 +0100, Bernd Kuhls wrote:
> When libcap was compiled before, kismet will use it as optional
> dependency:
> 
> $ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/bin/kismet_server | grep NEEDED
>  0x0000000000000001 (NEEDED)             Shared library: [libcap.so.2]
> [...]
> 
> The build system offers no option to en-/disable libcap support:
> https://www.kismetwireless.net/gitweb/?p=kismet.git;a=blob;f=configure.ac;h=e874b10f3c1d56e2deb5e8adf4b8da4066fdde56;hb=HEAD#l635
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kismet/kismet.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
