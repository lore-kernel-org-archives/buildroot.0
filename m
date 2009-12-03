From: Daniel Mack <daniel@caiaq.de>
Date: Thu, 3 Dec 2009 17:03:19 +0100
Subject: [Buildroot] Problems connecting to AT91SAM9260
In-Reply-To: <20091203154314.237790@gmx.net>
References: <20091203154314.237790@gmx.net>
Message-ID: <20091203160319.GF29442@buzzloop.caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Dec 03, 2009 at 04:43:14PM +0100, Jens Kleinhans wrote:
> I want to connect to the ARM board mentioned in the subject with
> minicom.
> So I connected the board with the RS232 interface and the USB_D
> interface to my host PC and configured minicom with the following
> parameters:
> 115200, 8bits, 1stop, no parity, no flow
> Then I powered up the board. It started sending some datas to minicom
> about the boot process. Then it ended up with the lines:
> Uncompressing Linux...RomBOOT
> >RomBOOT
> 
> I don't get the chance to communicate with the board. How can I
> communicate with minicom?

Your problem is not related to minicom. It's not related to buildroot
either. Most probably, your kernel simply doesn't boot, and there's a
huge load of possible reasons for that. You should really follow the
instructions found at the place or from the people you got the patchset
from. Or in last instance, go to linux-arm-kernel and ask for help
there. But I doubt that there will be much ambition to support such an
old version.

Again, this is the wrong list for that. And please don't cross-post
again. Everyone answering to your mails will get a bounce from rtai.org.

Daniel

> -- 
> Sarah Kreuz, die DSDS-Siegerin der Herzen, mit ihrem eindrucksvollen           
> Deb?talbum "One Moment in Time". http://portal.gmx.net/de/go/musik

OMFG.
