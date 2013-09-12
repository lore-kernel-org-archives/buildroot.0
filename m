From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Thu, 12 Sep 2013 18:44:32 +0000
Subject: [Buildroot] [PATCH 0/3] Support for out-of-tree Buildroot
 customization
In-Reply-To: <20130912203359.7e650ebe@skate>
References: <1378646129-4167-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <OF0AEEFBDE.5291EB54-ON86257BE3.0005DA76-86257BE3.00087A88@rockwellcollins.com>
 <20130911091700.0b24df41@skate>
 <OFA3C6DE52.DF6BBCA7-ON86257BE3.0054A3F9-86257BE3.00577394@rockwellcollins.com>
 <20130911172709.GB3410@free.fr>
 <CAAXf6LVD590fVudge3Fk+2B8pSzvUEV2GQLTcbz=VpOB2HCmtQ@mail.gmail.com>
 <20130912202157.536e5904@skate>
 <F9C551623D2CBB4C9488801D14F864C639AC8DAF@ex-mb1.corp.adtran.com>
 <20130912203359.7e650ebe@skate>
Message-ID: <F9C551623D2CBB4C9488801D14F864C639AC8DF7@ex-mb1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----Original Message-----
> From: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com]
> Sent: Thursday, September 12, 2013 1:34 PM
> To: ANDY KENNEDY
> Cc: Thomas De Schampheleire; buildroot at uclibc.org; Yann E. MORIN
> Subject: Re: [Buildroot] [PATCH 0/3] Support for out-of-tree Buildroot customization
> 
> Dear ANDY KENNEDY,
> 
> On Thu, 12 Sep 2013 18:25:40 +0000, ANDY KENNEDY wrote:
> 
> > This sounds much like the way Linux does things for the IP related
> > drivers.  Is that the intent we are going for (personally, I think this
> > is a GREAT idea, as it allows companies to have IP related widgets in
> > BuildRoot without the fear of being REQUIRED to push back their secret
> > sauce)?
> >
> > If that is what you intend, you have my vote!
> 
> I am not sure what you mean by "IP related drivers". Do you mean
> proprietary drivers?

Sorry, I thought that was a universal acronym.  Yes, IP is
Intellectual Property.

> 
> It is true that the BR2_EXTERNAL thing raises a licensing question:
> should the BR2_EXTERNAL contents also be released under GPLv2, like the
> rest of Buildroot? Do we really want the root filesystem overlays and
> other highly project-specific contents be released under GPLv2 ?

Whether one uses BuildRoot as their build system, I would think, would
not be a concern of those of us who work on BuildRoot.  Am I the only
one that feels this way?  I see Linux, and derivations of it, in this
case BuildRoot, as an ends to a means.  I hold the opinion that, if I
have added some minor tool like htop to the RFS, and someone can then
make a butt-load of money by my work then KUDOS TO THEM and shame on me
for not thinking of it in the first place.

I know that there are those that believe that if I walked near a person
who was thinking of GPL related code and I get an idea (not necessarily
related to what the individual was doing), that this idea should then be
GPL code as well (this seems to be the intent of GPLv3, though I stretch
the scenario somewhat).  I don't hold that view.  If I release something
back to BuildRoot, I'm doing so in the spirit in which I used BuildRoot
to begin with:  I am giving back to a community of friends that help me
make money.  If I can help you make money in return, I am happy to have
helped you.

Am I alone in this thinking?  I hope not.

Andy
