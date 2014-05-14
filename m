From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 May 2014 18:37:57 +0200
Subject: [Buildroot] [PATCH] libffi: back-port support for ARC
In-Reply-To: <1400078588.3178.6.camel@abrodkin-8560l>
References: <1398970819-17551-1-git-send-email-abrodkin@synopsys.com>
 <1399634834.3396.15.camel@abrodkin-8560l>
 <1400078588.3178.6.camel@abrodkin-8560l>
Message-ID: <20140514183757.111e792f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Wed, 14 May 2014 14:43:08 +0000, Alexey Brodkin wrote:

> > I'm wondering if there're chances to get this one reviewed or applied if
> > there're no objections?
> 
> It's been 2 weeks since I sent this patch so I may assume nobody has any
> objections. If so is there a chance to get this one applied?
> 
> libffi is a prerequisite for libgtk, gstreamer etc so we definitely need
> it.

Sorry for the lack of feedback. Since -rc1 has been released, we won't
merge such a patch for 2014.05, which probably explains why Peter has
not answered.

I'll try to test build your patch soon, and give my Tested-by so that
Peter can merge it in the 'next' branch. If you don't have a Tested-by
from me by the end of the week, ping me again (you can ping me on IRC
as well).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
