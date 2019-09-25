From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Sep 2019 21:53:40 +0200
Subject: [Buildroot] [PATCH 2/2] Revert "package/mesa3d: add OSMesa
 classic needs dri swrast"
In-Reply-To: <20190925191716.GE7274@scaer>
References: <20190925190556.5956-1-bernd.kuhls@t-online.de>
 <20190925190556.5956-2-bernd.kuhls@t-online.de>
 <20190925191716.GE7274@scaer>
Message-ID: <20190925215340.74b53775@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 25 Sep 2019 21:17:16 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> A revert is when a commit was faulty. But 1ad2c7f6 was not faulty : it
> properly accounted for a limitation of the upstream package.
> 
> However, it is the bump to a newer mesa3d version that allows to relax
> the condition now that upstream has lifted their limitation.
> 
> As such, IMHO, this patch should either:
> 
>   - be squashed with the previous one, keeping the link to the
>     upstream commit (which is very nice of you to provide!),
> 
>   - or be kept in a separate patch, but not identified as a revert.
> 
> I would favour the first option.

Agreed.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
