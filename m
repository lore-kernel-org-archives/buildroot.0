From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Jul 2017 00:59:46 +0200
Subject: [Buildroot] [PATCH] package/libunwind: fix build failure due to
 asm()
In-Reply-To: <20170703125038.4097-1-romain.naour@smile.fr>
References: <20170703125038.4097-1-romain.naour@smile.fr>
Message-ID: <20170704005946.3f59eb63@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  3 Jul 2017 14:50:38 +0200, Romain Naour wrote:
> The gcc documentation [1] suggest to use __asm__ instead of asm.
> 
> Fixes:
> http://autobuild.buildroot.net/results/3ef/3efe156b6494e4392b6c31de447ee2c72acc1a53
> 
> [1] https://gcc.gnu.org/onlinedocs/gcc/Alternate-Keywords.html#Alternate-Keywords
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...ibunwind-arm-fix-build-failure-due-to-asm.patch | 43 ++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 package/libunwind/0004-libunwind-arm-fix-build-failure-due-to-asm.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
