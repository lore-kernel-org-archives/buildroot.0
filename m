From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed, 14 Sep 2011 15:49:55 +0200
Subject: [Buildroot] [git commit] iw: bump to 3.1
In-Reply-To: <87sjnztfty.fsf@macbook.be.48ers.dk>
References: <20110913214743.1465A8D5A4@busybox.osuosl.org>
 <1316001130.5304.4.camel@sven> <87sjnztfty.fsf@macbook.be.48ers.dk>
Message-ID: <1316008211.8685.9.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2011-09-14 at 15:26 +0200, Peter Korsgaard wrote:
> >>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:
> 
>  Sven> Hi,
>  Sven> On Tue, 2011-09-13 at 23:44 +0200, Peter Korsgaard wrote:
> 
>  >> -IW_VERSION = 3.0
>  >> +IW_VERSION = 3.1
>  >> IW_SOURCE = iw-$(IW_VERSION).tar.bz2
>  >> IW_SITE = http://wireless.kernel.org/download/iw
> 
>  Sven> Does anyone happen to know an alternative download location for
>  Sven> iw-3.0.1.tar.bz2 ?
> 
>  Sven> As you probably know kernel.org is down for maintainance and
>  Sven> sources.buildroot.net does not seem to provide this release (yet).
> 
> Ahh yes, sorry - I fixed it up for util-linux, but I missed that
> one. I've populated sources.buildroot.net with the copy from here;
> 
> http://linuxwireless.org/download/iw/iw-3.1.tar.bz2

You also might want to add usbutils. I found a copy at a kernel.org
mirror:

http://ftp.halifax.rwth-aachen.de/pub/linux/utils/usb/usbutils/usbutils-004.tar.gz


Sven
