From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Jun 2019 14:27:40 +0200
Subject: [Buildroot] [PATCH] arch/Config.in.powerpc: remove unused gcc
 target abi options for powerpc
In-Reply-To: <20190526174246.14651-1-romain.naour@gmail.com>
References: <20190526174246.14651-1-romain.naour@gmail.com>
Message-ID: <20190601142740.289f9933@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 26 May 2019 19:42:46 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> gcc target abi options for powerpc were added by [1] and renamed by [2]
> to BR2_PPC_ABI_* but never used. Since always BR2_GCC_TARGET_ABI is empty
> when using a powerpc toolchain.
> 
> Buildroot currently support SPE and Classic target ABI, nothing seems
> to require a specific gcc target abi option.
> 
> This patch is a cleanup like commit [3].
> 
> [1] 7d8a59b40e46fa6ed84a5b78644327e97d04adef
> [2] 98175bd43dbfc70f473cca6759bc8a2f4e655734
> [3] fd08153b9d677d654add6c580b9ccc5c27d672e2
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Cyril Bur <cyrilbur@gmail.com>
> Cc: Sam Bobroff <sam.bobroff@au1.ibm.com>
> ---
>  arch/Config.in.powerpc | 8 --------
>  1 file changed, 8 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
