From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Nov 2015 15:38:59 +0100
Subject: [Buildroot] [PATCH 7/7 v3] autobuild: check for Linaro
 toolchains earlier
In-Reply-To: <a89f4ae40bd1f7d5600226eb0ac20f27098413fb.1448663846.git.yann.morin.1998@free.fr>
References: <cover.1448663846.git.yann.morin.1998@free.fr>
 <a89f4ae40bd1f7d5600226eb0ac20f27098413fb.1448663846.git.yann.morin.1998@free.fr>
Message-ID: <20151128153859.511d71af@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Fri, 27 Nov 2015 23:39:14 +0100, Yann E. MORIN wrote:
> When we get a configuration with those toolchains, we can not fix it.
> So we need to abort that configuration.
> 
> Fix the glibc version we check against (2.14, not 2.24).
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  scripts/autobuild-run | 29 +++++++++++++++++++----------
>  1 file changed, 19 insertions(+), 10 deletions(-)

Applied to buildroot-test, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
