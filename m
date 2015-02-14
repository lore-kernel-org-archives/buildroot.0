From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 14 Feb 2015 15:20:49 +0100
Subject: [Buildroot] [PATCH 01/12 v2] arch: kill avr32
In-Reply-To: <4ac969355610ac118df65e7873de2aafb480b1c0.1423905753.git.yann.morin.1998@free.fr>
References: <cover.1423905753.git.yann.morin.1998@free.fr>
 <4ac969355610ac118df65e7873de2aafb480b1c0.1423905753.git.yann.morin.1998@free.fr>
Message-ID: <54DF59C1.50802@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, all,

Le 14/02/2015 10:23, Yann E. MORIN a ?crit :
> avr32 was slated for removal in 2015.02. Make it so!
> 
> This patch only definitively hides the symbol. When all references
> to it are eradicated (to come in followup patches), we'll eventually
> kill the symbol altogether.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> ---
> Changes v1 -> v2:
>   - do nt move the symbol, hide with BR2_BROKEN  (Thomas)
> ---

While at it, why not removing BR2_m68k ?

This architecture has been marked BROKEN since...
2009-01-12 by Peter Korsgard.

http://git.buildroot.net/buildroot/commit/?id=8161c45b891aca4c3184c320de81a44767c7cece

Best regards,
Romain
