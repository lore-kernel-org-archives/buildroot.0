From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 14:43:18 +0100
Subject: [Buildroot] [PATCH 1/1] package/trace-cmd: add optional support
 for audit
In-Reply-To: <1456008742-4361-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456008742-4361-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160221144318.0e4e6d1c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 20 Feb 2016 23:52:22 +0100, Bernd Kuhls wrote:
> When audit was compiled before, trace-cmd will use it as optional
> dependency:
> 
> $ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/bin/trace-cmd | grep NEEDED | sort
>  0x0000000000000001 (NEEDED)             Shared library: [ld64-uClibc.so.1]
>  0x0000000000000001 (NEEDED)             Shared library: [libaudit.so.1]
>  0x0000000000000001 (NEEDED)             Shared library: [libc.so.1]
>  0x0000000000000001 (NEEDED)             Shared library: [libdl.so.1]
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/trace-cmd/trace-cmd.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
