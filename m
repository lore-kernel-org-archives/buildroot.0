From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Jul 2017 23:29:46 +0200
Subject: [Buildroot] [PATCH 3/4 v3] arch/arm: add big.LITTLE cpu variants
In-Reply-To: <218ce637cc4876f9f61b8b7bc13e4a59de7505c0.1499592591.git.yann.morin.1998@free.fr>
References: <cover.1499592591.git.yann.morin.1998@free.fr>
 <218ce637cc4876f9f61b8b7bc13e4a59de7505c0.1499592591.git.yann.morin.1998@free.fr>
Message-ID: <20170722232946.021aed0f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  9 Jul 2017 11:30:00 +0200, Yann E. MORIN wrote:
> The big.LITTLE configurations can be optimised for by gcc, and a few
> users wonder what they should choose when they have such CPUs.
> 
> Add new entries for those big.LITTLE configurations.
> 
> Note: the various combos were added in various gcc versions, but only
> really worked in later versions:
> 
>     Variant   | Introduced in | First built in
>     ----------+---------------+----------------
>     a15-a7    | 4.9           | 4.9
>     a17-a7    | 5             | 5
>     a57-a53   | 4.9           | 6
>     a72-a53   | 5             | 6
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Cc: Baruch Siach <baruch@tkos.co.il>
> 
> ---
> Changes v1 -> v2:
>   - remove superfluous parentheses  (Baruch)
> ---
>  arch/Config.in.arm                                 | 38 ++++++++++++++++++++++
>  package/gcc/Config.in.host                         |  5 ++-
>  .../Config.in                                      |  2 ++
>  .../toolchain-external-codesourcery-arm/Config.in  |  4 +++
>  4 files changed, 48 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
