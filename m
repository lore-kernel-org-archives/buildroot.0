From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Thu, 12 Sep 2013 18:25:40 +0000
Subject: [Buildroot] [PATCH 0/3] Support for out-of-tree Buildroot
 customization
In-Reply-To: <20130912202157.536e5904@skate>
References: <1378646129-4167-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <OF0AEEFBDE.5291EB54-ON86257BE3.0005DA76-86257BE3.00087A88@rockwellcollins.com>
 <20130911091700.0b24df41@skate>
 <OFA3C6DE52.DF6BBCA7-ON86257BE3.0054A3F9-86257BE3.00577394@rockwellcollins.com>
 <20130911172709.GB3410@free.fr>
 <CAAXf6LVD590fVudge3Fk+2B8pSzvUEV2GQLTcbz=VpOB2HCmtQ@mail.gmail.com>
 <20130912202157.536e5904@skate>
Message-ID: <F9C551623D2CBB4C9488801D14F864C639AC8DAF@ex-mb1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] On Behalf Of Thomas
> Petazzoni
> Sent: Thursday, September 12, 2013 1:22 PM
> To: Thomas De Schampheleire
> Cc: buildroot at uclibc.org; Yann E. MORIN
> Subject: Re: [Buildroot] [PATCH 0/3] Support for out-of-tree Buildroot customization
> 
> Dear Thomas De Schampheleire,
> 
> On Thu, 12 Sep 2013 09:54:56 +0200, Thomas De Schampheleire wrote:
> 
> > > Yes, as I said above, I would have expected companies (well, people at
> > > companies) be stressed by projects deadlines, and that they would work
> > > in BR2_EXTERNAL, and only try to upstream later, when it would be too
> > > late (for them!) to have proper reviews, since they would be internally
> > > committed to their changes in BR2_EXTERNAL, and we would not be able to
> > > take their changes.
> > >
> > > But if people use BR2_EXTERNAL as a fallback for anything that did not
> > > make it upstream (by lack of time, or of interest), or for purely
> > > internal stuff, then I don't see a reason for concern. All the better! :-)
> > >
> >
> > Not to ruin the atmosphere, but even though Ryan and his colleagues
> > may be using BR2_EXTERNAL 'the good way', ultimately helping the
> > buildroot project with their contributions, the danger of others not
> > doing that is still real. Of course, _not_ contributing changes made
> > in a company project was also possible previously, without
> > BR2_EXTERNAL, so this is no reason to block the patchset.
> 
> Yes, that's what I believe: companies and people are forking Buildroot
> nowadays. As I highlighted in my reply to Yann's e-mail, BR2_EXTERNAL
> may in fact encourage companies in separating their specific changes
> from the changes that could potentially be upstreamed, and therefore
> encourage upstream.
> 
> I really don't think BR2_EXTERNAL is going to make things worse in
> terms of upstreaming.

<snip>

This sounds much like the way Linux does things for the IP related
drivers.  Is that the intent we are going for (personally, I think this
is a GREAT idea, as it allows companies to have IP related widgets in
BuildRoot without the fear of being REQUIRED to push back their secret
sauce)?

If that is what you intend, you have my vote!
