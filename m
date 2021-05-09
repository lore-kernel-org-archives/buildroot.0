From: Drew Fustini <drew@beagleboard.org>
Date: Sun, 9 May 2021 13:29:11 -0700
Subject: [Buildroot] [PATCH v3 5/7] boot/beaglev-ddrinit: new package
In-Reply-To: <1ad5fb0c-a6e3-1ff2-f9f1-90a53084f968@mind.be>
References: <20210504205139.1055360-1-thomas.petazzoni@bootlin.com>
 <20210504205139.1055360-6-thomas.petazzoni@bootlin.com>
 <20210507220401.GE2137340@scaer>
 <0125b6ea-1e62-a893-0a0a-454dee7e0142@mind.be>
 <1ad5fb0c-a6e3-1ff2-f9f1-90a53084f968@mind.be>
Message-ID: <CAPgEAj6u4P_z=Pdq2wTMuWiNmE8LeDRmwuojFsgXQZWsOWhV8g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, May 9, 2021 at 4:04 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 09/05/2021 13:03, Arnout Vandecappelle wrote:
> >
> >
> > On 08/05/2021 00:04, Yann E. MORIN wrote:
> >> On 2021-05-04 22:51 +0200, Thomas Petazzoni spake thusly:
> >>> This commit adds a package for the DDR initialization code used on the
> >>> BeagleV platform.
> >>
> >> The upstream package name is beaglev-ddrlnit, yes, with an 'l' instead
> >> of an 'i'. I've renamed the package to match upstream name, so that
> >> users that look for it can actually find it.
> >
> >  What's done is done of course, but in this case, I think we should have stuck
> > to ddrinit with an eye. That name makes much more sense, and in fact when people
> > search for it (with / in menuconfig) they're IMHO much more likely to search for
> > it with an eye than with an el. The el you'd probably only use when you copy and
> > paste the name from github, but who does that?
> >
> >
> >  @Drew/Bing, on github, when you rename a repository, the old name will still
> > redirect to the new one (at least until you create a new repo with that name).
> > So I'd go ahead and to the rename to ddrinit, it should break anything.
>
>  I forgot the reference:
>
> https://docs.github.com/en/github/administering-a-repository/renaming-a-repository

Thank you.  I knew that the redirect worked on the website, but this
clarifies that it also works for git clone as well.  Therefore, it
seems like I should ask starfive to fix the typo as the old repo url
with the typo will still work.

-Drew
