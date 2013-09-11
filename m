From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 11 Sep 2013 13:48:12 +0200
Subject: [Buildroot] [PATCH 00/10] Enable SELinux Support in Existing
	Packages
In-Reply-To: <OFAE0C3563.5656CD6E-ON86257BE1.004AAF7F-86257BE1.004B2688@rockwellcollins.com>
References: <1378429464-12546-1-git-send-email-rjbarnet@rockwellcollins.com>
 <20130908182641.06c78a78@skate>
 <OFAE0C3563.5656CD6E-ON86257BE1.004AAF7F-86257BE1.004B2688@rockwellcollins.com>
Message-ID: <CAAXf6LX2+3VukwnPcW++iF=8XqcKQVscoGP2voY7_nkBbz1XtA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ryan,


On Mon, Sep 9, 2013 at 3:40 PM, <rjbarnet@rockwellcollins.com> wrote:
>
> Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on 09/08/2013 11:26:41 AM:
>
>
> > Dear Ryan Barnett,
> >
> > On Thu, 5 Sep 2013 20:04:14 -0500, Ryan Barnett wrote:
> > > This is the second set (of three) of patches to add SELinux support in
> > > buildroot. This patch set adds support for SELinux to existing packages
> > > in buildroot. This patch set is meant to be a follow-up to Clayton
> > > Shotwell's submission of "SELinux Buildroot Additions".
> > >
> > > In order to be able to test build existing packages with SELinux support,
> > > Clayton Shotwell's SELinux Buildroot Additions must first be applied.
> >
> > Thanks for those patches. I have some specific comments on some of
> > them, but I wanted to say that generally speaking, they look good. So
> > as soon as the previous patch series (which is a little bit more
> > complicated) gets merged, we will be able to merge those ones easily.
>
> I'll fix the patches with your suggestions, however I'll wait to resubmit
> a "v2" of these patch when the first set of SE Linux patches get accepting
> into mainline.
>


Not specifically related to this thread, but: would it be possible for
you to send your mails to the list in plain text mode, rather than
html?

Thanks,
Thomas
