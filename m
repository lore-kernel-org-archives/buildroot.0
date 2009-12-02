From: Joachim Pihl <jpihl@nevion.com>
Date: Wed, 2 Dec 2009 14:04:44 +0100
Subject: [Buildroot] Shared objects, load order?
In-Reply-To: <200912020644.43103.minimod@morethan.org>
References: <op.u4auhacnyqa4qb@jap> <200912020644.43103.minimod@morethan.org>
Message-ID: <op.u4bal6mdyqa4qb@jap>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 02 Dec 2009 13:44:40 +0100, Michael S. Zick <minimod@morethan.org>  
wrote:
>
> Did you enable sstrip?
> The sstrip in the 2009.8 (and probably in 2009.11, since I never saw it  
> fixed)
> creates object (and statically linked) objects with corrupted headers.
>
> Turn it off, rebuild, report back.

BR2_PACKAGE_SSTRIP_HOST enabled, BR2_PACKAGE_SSTRIP_TARGET disabled, but  
BR2_STRIP_strip is the one used.

Will rebuild anyway with BR2_PACKAGE_SSTRIP_HOST disabled, but I doubt it  
should make any difference.

-- 
Joachim Pihl
Senior R&D Engineer
Nevion Europe

Tel: +47 33 48 94 66
Fax: +47 33 48 99 98
Mobile: +47 91 33 98 91
jpihl at nevion.com
www.nevion.com

------------------------------------------------------
The Global Video Transport Leader
------------------------------------------------------
