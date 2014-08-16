From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Aug 2014 09:40:03 +0200
Subject: [Buildroot] [PATCH] manual: Add atomic intrinsics to the
 dependencies section
In-Reply-To: <20140815222308.GC27341@free.fr>
References: <20140803113216.03e0fb94@free-electrons.com>
 <1407154628-12791-1-git-send-email-Anton.Kolesov@synopsys.com>
 <20140816001725.27388fce@free-electrons.com>
 <20140815222308.GC27341@free.fr>
Message-ID: <20140816094003.7e55e67e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 16 Aug 2014 00:23:08 +0200, Yann E. MORIN wrote:

> Ah, I remember now, that we talked about that. My bad, I had forgotten
> during the review.
> 
> However, we can't really change the implementation now, we're frozen for
> the release.
> 
> What about adding this to the manual for now, since it does reflect the
> current status of the code, and switch to an architecture option in
> -next, or after the release is cut?

I disagree: it's still time to change this, before it gets set in stone
by doing a release.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
