From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 May 2015 12:02:04 +0200
Subject: [Buildroot] [PATCH] iproute2: disable xtables on static build
In-Reply-To: <fa972eff514e12b82ce7d6c557950f6e63b57724.1432188465.git.baruch@tkos.co.il>
References: <fa972eff514e12b82ce7d6c557950f6e63b57724.1432188465.git.baruch@tkos.co.il>
Message-ID: <20150521120204.4658ba22@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Thu, 21 May 2015 09:07:45 +0300, Baruch Siach wrote:
> iproute2 always builds m_xt.so as a shared library.
> 
> Fixes:
> http://autobuild.buildroot.net/results/f42/f42bbbf5be4594a8806d0e571586ce2bf119582d/
> http://autobuild.buildroot.net/results/3b3/3b37871bdf5766677fc20dca22c13177091d104f/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/iproute2/iproute2.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

There was already a patch posted by Romain for the same issue,
http://patchwork.ozlabs.org/patch/473600/. Some discussion with
Peter/Gustavo followed. Not clear what the conclusion was, though.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
