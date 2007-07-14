From: Thomas Lundquist <lists@zelow.no>
Date: Sat, 14 Jul 2007 16:04:11 +0200
Subject: [Buildroot] Adding X11R7 to buildroot
In-Reply-To: <f0528b5b0707120123n67046381k243e42ef36c4ac83@mail.gmail.com>
References: <f0528b5b0707120123n67046381k243e42ef36c4ac83@mail.gmail.com>
Message-ID: <20070714140411.GA24899@zelow.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jul 12, 2007 at 10:23:01AM +0200, Julien Letessier wrote:
> 
> I'm now starting to wonder
> * if the buildroot community is interested in including these >250
> packages in buildroot;

*hand*

> * how to include them (dropping hundreds of directories in package/ looks ugly);

My attempt was based on: 

x11-xserver
x11-libs
x11-drivers

and mainly .mk files inside those but directories might be a better
idea.

> * who's willing to help testing.

I am when I have time again. Finally some vacation coming up (France
here I come!

> Note that since all X packages use the GNU build system and are
> well-maintained and portable, they shouldn't require much maintenance
> here.

agreeed.


Thomas.
