From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jun 2014 22:04:29 +0200
Subject: [Buildroot] [PATCH 3/4] legal-info: add a comment about what
 packages we save the tarballs of
In-Reply-To: <d7b60854f85ee35d8bf21c60987fc0e34d4a059e.1403439879.git.yann.morin.1998@free.fr>
References: <cover.1403439879.git.yann.morin.1998@free.fr>
 <d7b60854f85ee35d8bf21c60987fc0e34d4a059e.1403439879.git.yann.morin.1998@free.fr>
Message-ID: <20140622220429.3bbd4698@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 22 Jun 2014 14:41:14 +0200, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> As the legal-info infra only (rightfully) saves the tarballs of packages
> that:
>   - we want to redistribute,
>   - and are not local,
>   - and are not overriden,
> 
> add a comment stating so.
> 
> This should clarify the code-block, which although trivial to read,
> was not easy to interpret without thinking thouroughly about it.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Fabio Porcedda <fabio.porcedda@gmail.com>
> Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  package/pkg-generic.mk | 3 +++
>  1 file changed, 3 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
