From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Feb 2015 22:08:44 +0100
Subject: [Buildroot] [PATCH 2/4] br-reproduce-build: use current
 directory as the default for outputs
In-Reply-To: <2f64e37394ac3c2806646babb32b498a2c598224.1423910953.git.yann.morin.1998@free.fr>
References: <cover.1423910953.git.yann.morin.1998@free.fr>
 <2f64e37394ac3c2806646babb32b498a2c598224.1423910953.git.yann.morin.1998@free.fr>
Message-ID: <20150214220844.4321d466@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 14 Feb 2015 11:52:04 +0100, Yann E. MORIN wrote:
> This allows the user running something like:
> 
>     cd /somewhere
>     /path/to/br-reproduce-build ID
> 
> Or even have br-reproduce-build in his PATH.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  utils/br-reproduce-build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
