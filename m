From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Nov 2017 21:22:03 +0100
Subject: [Buildroot] [for-next: v4: 2/2] package/solatus: new package
In-Reply-To: <20171129200452.16614-2-romain.naour@gmail.com>
References: <20171129200452.16614-1-romain.naour@gmail.com>
 <20171129200452.16614-2-romain.naour@gmail.com>
Message-ID: <20171129212203.6596ce6a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 29 Nov 2017 21:04:52 +0100, Romain Naour wrote:
> Sample quest and testing quest are not included in SOLARUS_LICENSE
> since it's notinstalled by default.
> 
> Remove Werror when building with debugging symbols.
> 
> Add libpng runtime dependency since solarus games require png image
> support.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Julien BOIBESSOT <julien.boibessot@armadeus.com>
> ---
> Q: The SDL2 Solarus support seems to needs at least one video renderer
>    (directfb, x11 or kms/drm) but the Salurs package selects none.
>    It's not explicitely listed in the build instructions:
>    http://www.solarus-games.org/development/compilation-instructions
>    How can we add a dependency on without introducing circular dependency
>    on SDL2 package?
>    As reported by Julien, if no video renderer is selected solarus doesn't
>    start. But selecting a video renderer is an user choice depending on
>    the target.

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
