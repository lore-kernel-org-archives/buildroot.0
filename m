From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Tue, 22 Oct 2013 09:40:58 -0500
Subject: [Buildroot] Buildroot Package Mirror Script
In-Reply-To: <20131022161048.2e23aed8@skate>
References: <OF57CE4CB6.E374A8CA-ON86257C0B.0069B646-86257C0B.0069B7CF@rockwellcollins.com>
 <20131021215849.GA3466@free.fr>	<20131022151011.715ec628@skate>	<OF1B2465A6.AABEECD2-ON86257C0C.0048E870-86257C0C.004924DF@rockwellcollins.com>
 <20131022161048.2e23aed8@skate>
Message-ID: <OFD7F2D2C0.B9EE63B3-ON86257C0C.004FCAD7-86257C0C.0050A10A@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote on 10/22/2013 
09:10:48 AM:

> Dear Ryan Barnett,
> 
> On Tue, 22 Oct 2013 08:19:12 -0500, Ryan Barnett wrote:
> 
> > > Also, I think 'make allyespackageconfig' + 'make source' is 
inherently
> > > broken: we have many Config.in "choice" statements, and depending on
> > > the value of the choice, the tarballs to pull will not be the same
> > > (packages supporting several versions, X.org big choice on KDrive 
vs.
> > > full modular X.org, etc.), so there is in fact no way to simply pull
> > > *all* possible tarballs. "make source" should guarantee you that it
> > > downloads all the sources needed for your *current* configuration. 
But
> > > there is no entirely full-proof way to download absolutely all 
possible
> > > tarballs that Buildroot may need.
> > 
> > Thanks for the information, I was hoping there was some magic that was
> > being done for the buildroot mirror that I was missing. I guess we 
will
> > just have to maintain an 'allyespackageconfig' that fixes all of the
> > gotchas.
> 
> It'd be nice though if you could give details about what those
> "gotchas" are, so we can see if they are gotchas that should be fixed,
> or inherent limitations of the Buildroot design.

I will be sure to let you guys know, right now I haven't had time to mess
around with too much other than to attempt 'make allyespackageconfig'
'make source'. At that point I gave up know it wasn't going to be as easy
as I thought it was...

Clayton Shotwell has been the person that has investigated this so I will
tell him to report his issues that he is experiencing.

Thanks,
-Ryan
