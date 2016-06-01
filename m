From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Jun 2016 10:19:53 +0200
Subject: [Buildroot] [arc-buildroot] [autobuild.buildroot.net] arc build
 results for 2016-05-31
In-Reply-To: <1464769003.3171.25.camel@synopsys.com>
References: <20160601063019.5D553101D2D@stock.ovh.net>
 <1464769003.3171.25.camel@synopsys.com>
Message-ID: <20160601101953.54e9e80d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 1 Jun 2016 08:17:21 +0000, Alexey Brodkin wrote:

> > ?????????arc |??????????????????jack2-v1.9.10 | NOK |
> > http://autobuild.buildroot.net/results/c05e4a5280f34b2a1dff8a10adfd46f53344e13a/  
> 
> So this one is almost fixed by Bernd but given he has no time for the real fix
> we'll take a look at proposed solution and hopefully will cook up a patch ourselves.

Aah, good. I proposed a fix in a reply to Bernd, I believe it should
work, it just needs to be tested a little bit on platforms where NGREG
is really defined.

> > ?????????arc |??????????????????mesa3d-11.2.2 | NOK |
> > http://autobuild.buildroot.net/results/6b29d2dc46a60d7b6aa442d2b2bad2795368bc81/
> > ?????????arc |??????????????????mesa3d-11.2.2 | NOK | http://autobuild.buildroot.net/results/8212b9ca27ccd88004135feb2
> > a96130d5906fc92/  
> 
> This long-standing mesa3d problem is fixed with newer tools, so once "next" becomes
> a new "master" issue will go away.

Excellent, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
