From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Dec 2015 13:52:14 +0100
Subject: [Buildroot] [PATCH 1/7] toolchain-external: CodeSourcery ARM:
 support only one version
In-Reply-To: <1450548886-21937-1-git-send-email-romain.naour@openwide.fr>
References: <1450548886-21937-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20151220135214.76f4e056@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sat, 19 Dec 2015 19:14:40 +0100, Romain Naour wrote:
> See the conclusion about external toolchains during the Buildroot
> meeting [1]:
> "In the future, we stick to a single external toolchain version. The
> Kconfig symbol should not encode the version (avoid legacy handling)"
> 
> [1] http://elinux.org/index.php?title=Buildroot:DeveloperDaysELCE2015#Report
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  toolchain/toolchain-external/Config.in             | 65 +---------------------
>  .../toolchain-external/toolchain-external.hash     |  2 -
>  toolchain/toolchain-external/toolchain-external.mk |  8 +--
>  3 files changed, 3 insertions(+), 72 deletions(-)

Entire series applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
