From: Mark Mason <mason+buildroot@postdiluvian.org>
Date: Mon, 20 Apr 2015 15:35:47 -0400
Subject: [Buildroot] dpkg and apt for buildroot?
In-Reply-To: <CAGm1_kvDWPPE1ajGbSHj9utnQuykgfqNr=tWVBg+PWNddGrDxQ@mail.gmail.com>
References: <20150414200222.GB7501@postdiluvian.org>
 <CAGm1_kvDWPPE1ajGbSHj9utnQuykgfqNr=tWVBg+PWNddGrDxQ@mail.gmail.com>
Message-ID: <20150420193546.GA3801@postdiluvian.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yegor Yefremov <yegorslists@googlemail.com> wrote:

> Dear Mark,
> 
> On Tue, Apr 14, 2015 at 10:02 PM, Mark Mason
> <mason+buildroot@postdiluvian.org> wrote:
> > Has anyone already done the footwork to add dpkg and apt (at least a
> > secure apt-get, I'm not sure what other dependancies there are)?
> >
> > I ran across some mail from July 2013 with patches for dpkg, which
> > were very close to working, but I didn't see any for apt.  I'm kind of
> > surprised that apt and friends aren't an option - am I about to run
> > into something unexpectedly complicated, or is complex package
> > management like apt/dpkg provides just generally outside of
> > buildroot's scope?
> >
> > While I'm at it, almost all of the traffic on this list is related to
> > development of buildroot rather than development with buildroot.  Is
> > there a better place for questions (after the documentation and web
> > searches have not provided answers), or is this it?
> 
> Have you read this section?
> http://nightly.buildroot.org/manual.html#faq-no-binary-packages

Sorry for the delays, I've been working on other stuff, just got back
to the packages.

I did read that section, but I'm not looking for packages of
buildroot, I just need apt to maintain software that's not part of
buildroot.
