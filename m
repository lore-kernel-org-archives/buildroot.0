From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Apr 2014 15:34:02 +0200
Subject: [Buildroot] [PATCH] libgc: fix build under uClibc
In-Reply-To: <0f149850960676b78e6e35678ab580c1e1aba73c.1398254403.git.baruch@tkos.co.il>
References: <0f149850960676b78e6e35678ab580c1e1aba73c.1398254403.git.baruch@tkos.co.il>
Message-ID: <20140423153402.6fb6b860@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Wed, 23 Apr 2014 15:00:03 +0300, Baruch Siach wrote:
> fenv.h is used in a workaround for a glibc specific bug. However, uClibc lies
> by defining __GLIBC__, but does not provide fenv.h in our default uClibc
> configurations.
> 
> Fixes:
> http://autobuild.buildroot.net/results/b2a/b2a1b1e374764855e701ea62fe9f1385ba77ac0d/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...01-Fix-build-on-Linux-x86_64-under-uClibc.patch | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 package/libgc/libgc-01-Fix-build-on-Linux-x86_64-under-uClibc.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
