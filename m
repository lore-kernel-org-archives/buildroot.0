From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 18:29:50 +0100
Subject: [Buildroot] [PATCH 2/2] package/omniorb: add optional support
 for openssl
In-Reply-To: <1456067932-12447-2-git-send-email-bernd.kuhls@t-online.de>
References: <1456067932-12447-1-git-send-email-bernd.kuhls@t-online.de>
 <1456067932-12447-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160221182950.2b0b0878@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 21 Feb 2016 16:18:52 +0100, Bernd Kuhls wrote:
> When openssl was compiled before, omniorb will use it as optional
> dependency:
> 
> $ output/host/usr/bin/x86_64-linux-readelf -a output/target/usr/lib/libomnisslTP4.so.2.0 | grep NEEDED
>  0x0000000000000001 (NEEDED)             Shared library: [libomniORB4.so.2]
>  0x0000000000000001 (NEEDED)             Shared library: [libomnithread.so.4]
>  0x0000000000000001 (NEEDED)             Shared library: [libpthread.so.1]
>  0x0000000000000001 (NEEDED)             Shared library: [libssl.so.1.0.0]
>  0x0000000000000001 (NEEDED)             Shared library: [libcrypto.so.1.0.0]
> [...]
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/omniorb/omniorb.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
