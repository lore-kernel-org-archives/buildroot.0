From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Jun 2016 09:17:58 +0200
Subject: [Buildroot] Patchwork cleanup, week #22
In-Reply-To: <20160601235354.1248a84e@gmx.net>
References: <20160601232654.07800a9b@free-electrons.com>
 <20160601235354.1248a84e@gmx.net>
Message-ID: <20160602091758.714c6990@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 1 Jun 2016 23:53:54 +0200, Peter Seiderer wrote:

> >  6/ Makefile: Fix overlay overwriting everything
> >     http://patchwork.ozlabs.org/patch/581463/
> > 
> >     A problem with the merged /usr option, and when the rootfs overlay
> >     contains specific directories. Discussion has happened, no decision.
> >   
> [...]
> 
> Was not aware of this patch (and the discussion) but the same change is
> already committed with a slightly different reasoning ([1])...

Thanks for the feedback. When I looked at Maxime's patch, I also had
the impression that the problem had already been fixed, but couldn't
spot the fix (I thought we fixed it in a different way, in the skeleton
package).

However, in the review of Maxime's patch, a number of issues have been
raised, so I'm wondering we have in the end merged your patch which
does the same, without answering those concerns.

Yann?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
