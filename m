From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 12:25:54 +0100
Subject: [Buildroot] [PATCH 1/1] package/xerces: add optional support
 for icu
In-Reply-To: <1456011625-29254-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456011625-29254-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160221122554.77d49473@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 21 Feb 2016 00:40:25 +0100, Bernd Kuhls wrote:
> When icu was compiled before, xerces will use it as optional dependency:
> 
> $ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/lib/libxerces-c-3.1.so | grep NEEDED | sort
>  0x0000000000000001 (NEEDED)             Shared library: [libc.so.1]
>  0x0000000000000001 (NEEDED)             Shared library: [libgcc_s.so.1]
>  0x0000000000000001 (NEEDED)             Shared library: [libicudata.so.56]
>  0x0000000000000001 (NEEDED)             Shared library: [libicui18n.so.56]
>  0x0000000000000001 (NEEDED)             Shared library: [libicuuc.so.56]
>  0x0000000000000001 (NEEDED)             Shared library: [libm.so.1]
>  0x0000000000000001 (NEEDED)             Shared library: [libstdc++.so.6]
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/xerces/xerces.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
