From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 14 May 2014 14:43:08 +0000
Subject: [Buildroot] [PATCH] libffi: back-port support for ARC
In-Reply-To: <1399634834.3396.15.camel@abrodkin-8560l>
References: <1398970819-17551-1-git-send-email-abrodkin@synopsys.com>
 <1399634834.3396.15.camel@abrodkin-8560l>
Message-ID: <1400078588.3178.6.camel@abrodkin-8560l>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter,

On Fri, 2014-05-09 at 15:27 +0400, Alexey Brodkin wrote:
> Hi,
> 
> On Thu, 2014-05-01 at 22:00 +0300, Alexey Brodkin wrote:
> > Support for ARC CPUs was added in libffi after 3.0.13 vesion was cut and up
> > until now no new release has been done. So to enale libffi on ARC we need this
> > set of patches.
> > 
> > These are corrsponding commits in libffi:
> >  * b082e15091961373c03d10ed0251f619ebb6ed76 - Add ARC support
> >  * 0f8690a84c874ec09a090c8c6adfb93c594acac6 - Rebuild for ARC additions
> >  * d918d47809c174d62283306b282749f8db93661f - arc: Fix build error
> > 
> > The first patch was modified a bit (cut changelog part) to accomodate
> > changes not related to ARC between 3.0.14 and changes in question.
> > 
> > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> > Signed-off-by: Misca Jonker <mjonker@synopsys.com>
> > 
> > Cc: Peter Korsgaard <peter@korsgaard.com>
> > Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> > ---
> >  package/libffi/libffi-arc-01-Add-ARC-support.patch | 560 +++++++++++++++++++++
> >  .../libffi-arc-02-Rebuild-for-ARC-additions.patch  | 262 ++++++++++
> >  .../libffi/libffi-arc-03-arc-Fix-build-error.patch |  43 ++
> >  3 files changed, 865 insertions(+)
> >  create mode 100644 package/libffi/libffi-arc-01-Add-ARC-support.patch
> >  create mode 100644 package/libffi/libffi-arc-02-Rebuild-for-ARC-additions.patch
> >  create mode 100644 package/libffi/libffi-arc-03-arc-Fix-build-error.patch
> 
> I'm wondering if there're chances to get this one reviewed or applied if
> there're no objections?

It's been 2 weeks since I sent this patch so I may assume nobody has any
objections. If so is there a chance to get this one applied?

libffi is a prerequisite for libgtk, gstreamer etc so we definitely need
it.

Regards,
Alexey
