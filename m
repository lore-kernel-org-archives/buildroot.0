From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Feb 2015 16:23:18 +0100
Subject: [Buildroot] [PATCH 01/12 v2] arch: kill avr32
In-Reply-To: <54DF59C1.50802@openwide.fr>
References: <cover.1423905753.git.yann.morin.1998@free.fr>
 <4ac969355610ac118df65e7873de2aafb480b1c0.1423905753.git.yann.morin.1998@free.fr>
 <54DF59C1.50802@openwide.fr>
Message-ID: <20150214162318.2c2d8912@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sat, 14 Feb 2015 15:20:49 +0100, Romain Naour wrote:

> While at it, why not removing BR2_m68k ?
> 
> This architecture has been marked BROKEN since...
> 2009-01-12 by Peter Korsgard.

I got contacted by a person interested in bringing back to speed the
m68k support. And the m68k doesn't have as much impact as the avr32
support in terms of custom patches, specific handling and so on.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
