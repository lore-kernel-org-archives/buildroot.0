From: Ulf Samuelsson <ulf@atmel.com>
Date: Thu, 12 Jul 2007 13:36:10 +0200
Subject: [Buildroot] Adding X11R7 to buildroot
In-Reply-To: <f0528b5b0707120123n67046381k243e42ef36c4ac83@mail.gmail.com>
References: <f0528b5b0707120123n67046381k243e42ef36c4ac83@mail.gmail.com>
Message-ID: <1184240170.5175.2.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tor 2007-07-12 klockan 10:23 +0200 skrev Julien Letessier:
> Hi folks,
> 
> As some of you known I've been working on X11R7.1 packages for
> buildroot. These packages may replace xorg and tinyx.
> Patches have ben sumbitted in previous emails.
> 
> I'm now starting to wonder
> * if the buildroot community is interested in including these >250
> packages in buildroot;
> * how to include them (dropping hundreds of directories in package/ looks ugly);
> * who's willing to help testing.
> 

Why not create "packages/X11R7" and then put all X11 package directories
below that directory?

I would be very interested in having X11R7 support in buildroot.


> Note that since all X packages use the GNU build system and are
> well-maintained and portable, they shouldn't require much maintenance
> here.
> 
> What's your opinion?

Best Regards
Ulf Samuelsson
