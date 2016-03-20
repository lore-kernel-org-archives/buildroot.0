From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 21:48:56 +0100
Subject: [Buildroot] [PATCH 2/2 v2] package/jack2: add comment about
 celt and eigen
In-Reply-To: <dc794aba76e931a0c7bb974016708c51b77d3f6b.1457719085.git.yann.morin.1998@free.fr>
References: <cover.1457719085.git.yann.morin.1998@free.fr>
 <dc794aba76e931a0c7bb974016708c51b77d3f6b.1457719085.git.yann.morin.1998@free.fr>
Message-ID: <20160320214856.3ba3477a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 11 Mar 2016 19:00:35 +0100, Yann E. MORIN wrote:
> The optinal dependency on celt is not added, because we only have
> celt-0.5.1 and jack2 requires celt >= 0.5.2 (even though it does look
> for celt >= 0.5.0, it does not build with celt- < 0.5.2). Sinc ewe can
> not upgrade celt (for now), we just never make jack2 depend on celt051,
> and it won;t find it either, as it just searches for celt.pc and we have
> celt051.pc.
> 
> As well, the dependency on eigen is only usefull in cunjunction with
> gtkiostream, for which we do not have a package. So, we need not depend
> on eigen.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/jack2/jack2.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)

Applied after fixing some typos. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
