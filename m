From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Jan 2018 22:26:02 +0100
Subject: [Buildroot] [PATCH] support/config-fragments:
 br-powerpc-internal-full: remove old option
In-Reply-To: <20180109225407.24501-3-romain.naour@gmail.com>
References: <20180109225407.24501-1-romain.naour@gmail.com>
 <20180109225407.24501-3-romain.naour@gmail.com>
Message-ID: <20180112222602.14c9eb75@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  9 Jan 2018 23:54:07 +0100, Romain Naour wrote:
> BR2_TOOLCHAIN_BUILDROOT_INET_IPV6 has been removed with the commit [1].
> 
> Since this option is still in br-powerpc-internal-full config-fragment,
> the powerpc configuration is droped by autobuild-run script:
> 
> WARN: toolchain can't be used
>       Missing: BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
> [Sat, 06 Jan 2018 03:03:43] WARN: failed to generate configuration
> 
> [1] 4bcacfd2c05f45171c011d4af7731c6f848819a4
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  support/config-fragments/autobuild/br-powerpc-internal-full.config | 1 -
>  1 file changed, 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
