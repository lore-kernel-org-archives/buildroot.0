From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jul 2019 08:54:50 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/cpio: add host version
In-Reply-To: <20190716173518.11081-1-itsatharva@gmail.com>
References: <20190716173518.11081-1-itsatharva@gmail.com>
Message-ID: <20190717085450.2022478c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 16 Jul 2019 23:05:17 +0530
Atharva Lele <itsatharva@gmail.com> wrote:

> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> The latest cpio has a --reproducible option, which may come handy when
> we try to, well, be reproducible...
> 
> Reported-by: Arnout Vandecappelle <arnout@mind.be>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> [Atharva: don't force --bindir, as noticed by Arnout]
> Signed-off-by: Atharva Lele <itsatharva@gmail.com>
> Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Atharva Lele <itsatharva@gmail.com>
> ---
> Changes v1 -> v2:
>   - Add patch from Yann to my series
>   - Fix [Atharva: ] comment
> ---
>  package/cpio/cpio.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
