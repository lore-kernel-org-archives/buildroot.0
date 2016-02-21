From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 15:02:47 +0100
Subject: [Buildroot] [PATCH 1/3] package/syslog-ng: add optional support
 for libcap
In-Reply-To: <1455997877-9594-1-git-send-email-bernd.kuhls@t-online.de>
References: <1455997877-9594-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160221150247.7acf77bb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 20 Feb 2016 20:51:15 +0100, Bernd Kuhls wrote:
> When libcap was compiled before, syslog-ng will use it as optional
> dependency:
> 
> $ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/sbin/syslog-ng | grep NEEDED | sort
>  0x0000000000000001 (NEEDED)             Shared library: [libcap.so.2]
> [...]
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/syslog-ng/syslog-ng.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

All three patches applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
