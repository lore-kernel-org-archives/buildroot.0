From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Jan 2015 16:34:46 +0100
Subject: [Buildroot] [PATCH 1/4 v9] Makefile: improve detection of make
 "-s" flag
In-Reply-To: <3e5ffa778bc4dea304fd9897fc983c294a0c7dc9.1420142462.git.yann.morin.1998@free.fr>
References: <cover.1420142462.git.yann.morin.1998@free.fr>
 <3e5ffa778bc4dea304fd9897fc983c294a0c7dc9.1420142462.git.yann.morin.1998@free.fr>
Message-ID: <20150102163446.06b784a8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu,  1 Jan 2015 21:03:50 +0100, Yann E. MORIN wrote:
> From: Fabio Porcedda <fabio.porcedda@gmail.com>
> 
> Because it's just checking the presence of the "s" character even a
>   make --warn-undefined-variables
> is detected as a silent build.
> 
> Fix that by filtering out long options.
> 
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
