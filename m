From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 20 May 2014 10:29:29 +0000
Subject: [Buildroot] [PATCH] libffi: back-port support for ARC
In-Reply-To: <20140514183757.111e792f@free-electrons.com>
References: <1398970819-17551-1-git-send-email-abrodkin@synopsys.com>
 <1399634834.3396.15.camel@abrodkin-8560l>
 <1400078588.3178.6.camel@abrodkin-8560l>
 <20140514183757.111e792f@free-electrons.com>
Message-ID: <1400581768.4364.14.camel@abrodkin-8560l>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

On Wed, 2014-05-14 at 18:37 +0200, Thomas Petazzoni wrote:
> Dear Alexey Brodkin,
> 
> On Wed, 14 May 2014 14:43:08 +0000, Alexey Brodkin wrote:
> 
> > > I'm wondering if there're chances to get this one reviewed or applied if
> > > there're no objections?
> > 
> > It's been 2 weeks since I sent this patch so I may assume nobody has any
> > objections. If so is there a chance to get this one applied?
> > 
> > libffi is a prerequisite for libgtk, gstreamer etc so we definitely need
> > it.
> 
> Sorry for the lack of feedback. Since -rc1 has been released, we won't
> merge such a patch for 2014.05, which probably explains why Peter has
> not answered.
> 
> I'll try to test build your patch soon, and give my Tested-by so that
> Peter can merge it in the 'next' branch. If you don't have a Tested-by
> from me by the end of the week, ping me again (you can ping me on IRC
> as well).

This is a gentle reminder for you if you haven't yet tested this patch.

Regards,
Alexey
