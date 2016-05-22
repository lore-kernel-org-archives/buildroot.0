From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 May 2016 21:37:25 +0200
Subject: [Buildroot] [PATCH] putty: fix musl build for 64-bit targets
In-Reply-To: <a70938c68e64db7ca57acc45cf20ebc0601c2805.1463944636.git.baruch@tkos.co.il>
References: <a70938c68e64db7ca57acc45cf20ebc0601c2805.1463944636.git.baruch@tkos.co.il>
Message-ID: <20160522213725.40946bff@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 22 May 2016 22:17:16 +0300, Baruch Siach wrote:
> Add upstream patch fixing MinGW build that also fixes musl build. Both of them
> do not provide __uint64_t on 64-bit targets.
> 
> Fixes:
> http://autobuild.buildroot.net/results/8f7/8f7683b2e204249c37690bae915208298ea94490/
> http://autobuild.buildroot.net/results/f28/f2836f3a7e27f74f5adf38d1769b9b047d59c385/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...02-Fix-__uint128_t-compile-error-on-MinGW.patch | 30 ++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 package/putty/0002-Fix-__uint128_t-compile-error-on-MinGW.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
