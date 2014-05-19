From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 May 2014 11:35:57 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-05-18
In-Reply-To: <39A54937CC95F24AA2F794E2D2B66B1356CCD6CE@de02wembxa.internal.synopsys.com>
References: <20140519063009.7B5A9100E3F@stock.ovh.net>
 <39A54937CC95F24AA2F794E2D2B66B1356CCD6CE@de02wembxa.internal.synopsys.com>
Message-ID: <20140519113557.5f0ef8a6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Anton Kolesov,

On Mon, 19 May 2014 09:33:07 +0000, Anton Kolesov wrote:

> >        arc |                  mplayer-1.1.1 | NOK |
> > http://autobuild.buildroot.net/results/af1ca869dbc7a71aa4cc89373d605ca8f7
> > 90fcc9/
> 
> [AK:] ARC is now supported in the MPlayer trunk. So this problem will go away with the next MPlayer release, though no idea when this will happen.

If the patch to support ARC is small, we could integrate it in
Buildroot. If not, waiting for the next release is indeed better.

I also wonder how we will 'discover' that a given package is now
available for a certain architecture for which it was disabled. I guess
the only solution is for someone interested by this architecture to
notice that it can now be enabled.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
