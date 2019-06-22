From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Jun 2019 17:50:13 +0200
Subject: [Buildroot] [PATCH] package/coreutils: simplify the [ -> test
 symlink
In-Reply-To: <20190622131936.10121-1-yann.morin.1998@free.fr>
References: <20190622131936.10121-1-yann.morin.1998@free.fr>
Message-ID: <20190622175013.2c6cdd12@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 22 Jun 2019 15:19:36 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Wheter we are mutli-call or multi-binaries, test is either a symlink to
> coreutils or a standalone binary.
> 
> Consequently, test always exists, and so we can simplify the [ symlink.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Markus Mayer <mmayer@broadcom.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/coreutils/coreutils.mk | 6 ------
>  1 file changed, 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
