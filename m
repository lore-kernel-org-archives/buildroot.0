From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Oct 2015 18:34:15 +0100
Subject: [Buildroot] [PATCH 1/5] toolchain/external: commonalise
 comments about Linaro toolchains
In-Reply-To: <376787b59e2113f2b072918ed14fae488f144bd2.1442785491.git.yann.morin.1998@free.fr>
References: <cover.1442785491.git.yann.morin.1998@free.fr>
 <376787b59e2113f2b072918ed14fae488f144bd2.1442785491.git.yann.morin.1998@free.fr>
Message-ID: <20151004183415.027b56ce@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 20 Sep 2015 23:45:49 +0200, Yann E. MORIN wrote:
> Those two comments:
>   - are exactly the same
>   - have the same dependencies (except for arm/armeb)
> 
> So, make it a common comment. It will be useful to have that comment
> when we introduce new Linaro toolchain versions.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  toolchain/toolchain-external/Config.in | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
