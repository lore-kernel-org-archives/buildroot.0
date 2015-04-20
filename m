From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 20 Apr 2015 08:39:07 +0000
Subject: [Buildroot] [PATCH] uclibc: clean-up test suite build command
In-Reply-To: <20150325173919.0b2d0528@free-electrons.com>
References: <1404149181-18586-1-git-send-email-abrodkin@synopsys.com>
 <20140630200719.1339a6ed@free-electrons.com>
 <1427269764.2718.4.camel@synopsys.com>
 <20150325173919.0b2d0528@free-electrons.com>
Message-ID: <1429519146.2756.2.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, 2015-03-25 at 17:39 +0100, Thomas Petazzoni wrote:
> Dear Alexey Brodkin,
> 
> On Wed, 25 Mar 2015 07:49:24 +0000, Alexey Brodkin wrote:
> 
> > > Unfortunately, unless this cleaned-up version brings significant
> > > benefits, I believe the best option is to keep things as is until AVR32
> > > support is really deprecated and removed from Buildroot, so that we can
> > > drop support for 0.9.31.
> > 
> > Now when AVR32 support is finally dropped do you think this patch might
> > be accepted?
> 
> Yes, sure! AVR32 / supporting old uClibc versions was the only reason
> to keep the old way around. Now that AVR32 is gone, all clean-ups we
> can do following this removal are very welcome.

Please treat this as a gentle reminder. I'm wondering if that pretty
straight-forward change has a chance for being applied?

From your previous answer I understood that you\re in general fine with
clean-up stuff like that.

-Alexey
