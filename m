From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Nov 2015 21:09:42 +0100
Subject: [Buildroot] [PATCH 1/3] core/pkg-autotools: align host
 configure commands to target one
In-Reply-To: <20151123175112.GF3857@free.fr>
References: <cover.1448202976.git.yann.morin.1998@free.fr>
 <f288b50c4267ceb0ca24aa1a7937d8f5fa894ed5.1448202976.git.yann.morin.1998@free.fr>
 <20151123183829.077c602c@free-electrons.com>
 <20151123175112.GF3857@free.fr>
Message-ID: <20151123210942.3bc09adc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Mon, 23 Nov 2015 18:51:12 +0100, Yann E. MORIN wrote:

> > >  package/pkg-autotools.mk | 12 ++++++------
> > >  1 file changed, 6 insertions(+), 6 deletions(-)
> > 
> > Applied to next, thanks.
> 
> In the cover-letter, I suggestd this be applied to master. Did you
> overlook that part, or did you apply to next on-purpose? Ditto the
> second patch.

What would the reasoning to apply such patches on master? They don't
fix any problem or bug, so they have no reason to be applied on master.
They are good for consistency and documentation, but this is clearly
not enough to justify being merged for master IMO.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
