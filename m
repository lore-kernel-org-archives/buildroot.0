From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Tue, 8 Oct 2013 18:56:58 -0500
Subject: [Buildroot] [PATCH 1/1] manual: update review process and
	patchwork
In-Reply-To: <20131008234943.688148ea@skate>
References: <1381266205-29322-1-git-send-email-rjbarnet@rockwellcollins.com>
 <20131008234943.688148ea@skate>
Message-ID: <OF032063C8.7C30111E-ON86257BFE.008322E8-86257BFE.00838F19@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas P.,

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on 10/08/2013 
04:49:43 PM:

> Dear Ryan Barnett,
> 
> On Tue, 8 Oct 2013 16:03:25 -0500, Ryan Barnett wrote:
> > Adding more documentaiton based on discussion from the mailing list
> > in regards the buildroot review process and how patchworks can be
> > used to pull in patches for testing purposes.
> > 
> > Mailing list discussion:
> > 
http://lists.busybox.net/pipermail/buildroot/2013-September/078170.html
> > 
> > Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
> 
> Thanks, looks good! A few comments below.
> 
> > +The patchworks website can be used to pull in patches for testing
> > +purposes. Please see xref:apply-patches-patchwork[] for more
> > +information on using the patchworks website to apply patches.
> 
> It's actually "patchwork", not "patchworks", as far as I can see.

Yeah sorry, for whatever reason I always want to put an 's' on it when
I say it and I tired to be careful when I typed it but this slipped
through the cracks. I will fix this.
 
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
> > +Buildroot utilizes this tool to ensure patches aren't missed
> > +along with exposing all patches and their corresponding review 
comments
> > +in a clean web interface.
> 
> This looks good, but I would probably emphasize the fact that patchwork
> is mainly a tool for the maintainers and core contributors. Newcomers
> don't have to worry about patchwork. I believe this was the original
> misunderstanding that you had, thinking that you had to somehow
> interact with patchwork to get your patches reviewed or accepted, which
> is not the case.

I will reword that last paragraph you quoted to make it even more clear 
that
patchwork is intended to mainly be used by the maintainer.
 
> Best regards,
> 
> Thomas

Thanks,
-Ryan
