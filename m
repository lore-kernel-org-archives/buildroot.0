From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 May 2020 23:32:15 +0200
Subject: [Buildroot] [PATCHv2] package/fmc+fmlib: change repository
 location
In-Reply-To: <20200527154734.11381-1-yann.morin.1998@free.fr>
References: <20200527154734.11381-1-yann.morin.1998@free.fr>
Message-ID: <20200529233215.014d37d2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 27 May 2020 17:47:34 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Now that Freescale has been wholly swallowed into NXP, the public-facing
> git repositories that were hosting those two packages are no longer
> available.
> 
> Fortunately, they had been mirrored on Code Aurora forge (a Linux
> Foundation project, so relatively stable and trustworthy), which has the
> tags we need, and that generates the exact same archives.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
> 
> ---
> Changes v1 -> v2:
>   - use CodeAurora's git tree, rather than archives on s.b.o.  (Matt)
> ---
>  package/fmc/fmc.mk     | 3 ++-
>  package/fmlib/fmlib.mk | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
