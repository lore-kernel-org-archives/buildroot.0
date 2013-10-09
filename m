From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Wed, 9 Oct 2013 08:01:25 -0500
Subject: [Buildroot] [PATCH v2 1/1] manual: update review process and
	patchwork
In-Reply-To: <CAAXf6LXdEikqkXSWJywPwDXraWtnE8teYFNwMOs8oW6YP2JfgA@mail.gmail.com>
References: <1381278711-24631-1-git-send-email-rjbarnet@rockwellcollins.com>
 <CAAXf6LXdEikqkXSWJywPwDXraWtnE8teYFNwMOs8oW6YP2JfgA@mail.gmail.com>
Message-ID: <OFE85A6A03.946CB738-ON86257BFF.00470072-86257BFF.00478ADB@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas D.,

Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote on 10/09/2013 
01:50:57 AM:

> Hi Ryan,
> 
> On Wed, Oct 9, 2013 at 2:31 AM, Ryan Barnett
> <rjbarnet@rockwellcollins.com> wrote:
> > Adding more documentaiton based on discussion from the mailing list
> > in regards the buildroot review process and how patchworks can be
> > used to pull in patches for testing purposes.
> >
> > Mailing list discussion:
> > 
http://lists.busybox.net/pipermail/buildroot/2013-September/078170.html
> >
> > Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
> >
> > ---
> >
> > v1 -> v2
> >  * Updated all references to patchwork to be Patchwork or Buildroot's
> >    Patchwork instead of a few misspellings (suggested by Thomas
> >    Petazzoni)
> >  * Added clarification that patchwork main use is for the Buildroot
> >    maintainer (suggested by Thomas Petazzoni)
> >
> > Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
> > ---
> >  docs/manual/contribute.txt   |   12 +++++++++++-
> >  docs/manual/get-involved.txt |   38 
+++++++++++++++++++++++++++++++++++---
> >  2 files changed, 46 insertions(+), 4 deletions(-)
> >
> > diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
> > index 2b2783d..201685c 100644
> > --- a/docs/manual/contribute.txt
> > +++ b/docs/manual/contribute.txt
> > @@ -132,9 +132,15 @@ $ git format-patch --subject-prefix "PATCH v4" \
> >  Reviewing/Testing patches
> >  -------------------------
> >
> > +The review process for new patches is done over the mailing list. 
Once
> > +a patch is submitted to the mailing list, other developers will 
provide
> > +feedback to the patch via emails sent through the mailing list.
> > +
> >  In the review process, do not hesitate to respond to patch 
submissions
> >  for remarks, suggestions or anything that will help everyone to
> > -understand the patches and make them better.
> > +understand the patches and make them better. Please use internet
> > +style replies in plain text emails when responding to patch
> > +submissions.
> >
> >  Some tags are used to help following the state of any patch posted on
> >  the mailing-list:
> > @@ -144,6 +150,10 @@ Acked-by:: Indicates that the patch can be 
committed.
> >  Tested-by:: Indicates that the patch has been tested. It is useful
> >    but not necessary to add a comment about what has been tested.
> >
> > +Buildroot's Patchwork website can be used to pull in patches for 
testing
> > +purposes. Please see xref:apply-patches-patchwork[] for more
> > +information on using Buildroot's Patchwork website to apply patches.
> > +
> >  Autobuild
> >  ---------
> >
> > diff --git a/docs/manual/get-involved.txt 
b/docs/manual/get-involved.txt
> > index 8515d34..173b0f4 100644
> > --- a/docs/manual/get-involved.txt
> > +++ b/docs/manual/get-involved.txt
> > @@ -55,11 +55,43 @@ using a code sharing website.
> >  Patchwork
> >  ---------
> >
> > -The Buildroot patch management interface is at
> > +Patchwork is a web-based patch tracking system designed to facilitate
> > +the contribution and management of contributions to an open-source
> > +project. Patches that have been sent to a mailing list are \'caught' 
by
> > +the system, and appear on a web page. Any comments posted that
> > +reference the patch are appended to the patch page too. For more
> > +information on Patchwork see
> > +http://jk.ozlabs.org/projects/patchwork[].
> > +
> > +Buildroot's Patchwork website is mainly for use by the Buildroot's
> > +maintainer to ensure patches aren't missed. The website however,
> > +exposes patches and their corresponding review comments in a clean
> > +and concise web interface.
> > +
> > +The Buildroot patch management interface is available at
> >  http://patchwork.buildroot.org[].
> >
> > -All patches and comments sent through the mailing list are
> > -automatically indexed in http://patchwork.buildroot.org[patchwork].
> > +[[apply-patches-patchwork]]
> > +Applying Patches from Patchwork
> > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +Buildroot's Patchwork website main use for a developer is for pulling
> > +in patches into their local git repository for testing purposes.
> > +
> > +When browsing patches in the patchwork management interface, a +mbox+
> 
> shouldn't this be 'an mbox' because you pronounce mbox as embox ?

I was on the fence on this one too and with this question you are now
testing my grammar education from primary school :) I did do a bit of
google research on this and have come to the conclusion that I used 'a'
correctly in this instance. Please see this website which is consider
in the US to be a reputable source for English writing:

https://owl.english.purdue.edu/owl/resource/591/01

> Best regards,
> Thomas

Thanks,
-Ryan
