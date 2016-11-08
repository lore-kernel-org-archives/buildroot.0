From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Nov 2016 16:39:30 +0100
Subject: [Buildroot] Autobuilder issue
In-Reply-To: <CANQCQpbG0=nKggYevXpyJVCT4N48+mKbapb_4oCkJCuSTPbG+Q@mail.gmail.com>
References: <20161108094539.6f9b4534@free-electrons.com>
 <CANQCQpbG0=nKggYevXpyJVCT4N48+mKbapb_4oCkJCuSTPbG+Q@mail.gmail.com>
Message-ID: <20161108163930.5f65bb38@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 8 Nov 2016 06:11:09 -0600, Matthew Weber wrote:

> > So the problem your autobuilder instance is reporting should not occur,
> > i.e it should not be possible to start the build of a configuration
> > that has BR2_NEEDS_HOST_JAVAC=y if javac is not installed. My
> > autobuilder instance does *not* have javac installed, and does not
> > report those core-dependencies failures.
> >
> > Did you change anything in your autobuilder instance recently?  
> I haven't on that instance.
> 
> > Installed/removed some packages? Modified the autobuild-run script?  
> The auto builder script is modified to generate a smaller package set then
> the default so that I can use a less powerful machine. My guess would be a
> issue with this logic.

It would be better to upstream such changes, so that they can be
reviewed. Having people run custom versions of the autobuild-run script
can really lead to surprising things.

> > Could you have a look at what's going on?  
> I've stopped that instance until I can look at it tonight.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
