From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Apr 2014 09:15:33 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-04-13
In-Reply-To: <20140414065113.GB9805@tarshish>
References: <20140414063009.3F4A6100DD1@stock.ovh.net>
 <20140414065113.GB9805@tarshish>
Message-ID: <20140414091533.1a0e16e5@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Mon, 14 Apr 2014 09:51:13 +0300, Baruch Siach wrote:

> On Mon, Apr 14, 2014 at 08:30:09AM +0200, Thomas Petazzoni wrote:
> > Build statistics for 2014-04-13
> > ===============================
> > 
> >       i686 |                      mtd-1.5.1 | NOK | http://autobuild.buildroot.net/results/0d24f506c7603a833ed72a5b0267111b8353f88f/
> 
> What version of uClibc is used here?

uClibc 0.9.33. So that's weird, your fix should have worked for this
build, as this build was made at commit
fae7cc33a117d5408019b705d76ebb4549593f88, which is precisely the commit
of your mtd fix.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
