From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Dec 2018 22:19:21 +0100
Subject: [Buildroot] [PATCH] infra/pkg-generic: use readlink instead of
 realpath
In-Reply-To: <20181201215155.29106-1-yann.morin.1998@free.fr>
References: <20181201215155.29106-1-yann.morin.1998@free.fr>
Message-ID: <20181206221921.59e38f32@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  1 Dec 2018 22:51:55 +0100, Yann E. MORIN wrote:
> realpath is missing on oldish distributions, like Debian 7, which is
> still sued in the wild.
> 
> Use readlink instead; that has been available since the dawn of ages now
> (well, coreutils had it in 2003).
> 
> Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/pkg-generic.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Seems like I forgot to say that I had applied this patch, on December
2. So: applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
