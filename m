From: Hamish Moffatt <hamish@cloud.net.au>
Date: Thu, 24 Jul 2008 10:58:43 +1000
Subject: [Buildroot] Openssl won't compile
In-Reply-To: <48874FEF.9070208@gnat.ca>
References: <4886A1F4.1010900@gnat.ca> <20080723133519.GA27147@cloud.net.au>
	<48874FEF.9070208@gnat.ca>
Message-ID: <20080724005843.GB19842@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jul 23, 2008 at 09:36:15AM -0600, Nathanael D. Noblet wrote:
> Hamish Moffatt wrote:
> > On Tue, Jul 22, 2008 at 09:13:56PM -0600, Nathanael D. Noblet wrote:
> >> Hello,
> >>    Anyone experience difficulty compiling openssl (0.9.7m)? I get a 
> >> missing sys/timeb.h, upgrading to ssl 0.9.8g) is no better as the 
> >> patches don't apply and I'm not sure what the ones I couldn't fix were 
> >> doing.
> >>
> >>    For what it is worth, I'm using gcc-3.1 and a daily snapshot of uclibc.
> > 
> > I'm not having any trouble building it for armeb with gcc 4.1.2 with
> > uClibc 0.9.29.
> 
> Using 0.9.29 I can't boot my target device. The rootfs boots in qemu but 
> I get a general protection fault on the real hardware. I've tried 4.2.x 
> and 4.3 and 4.4. Perhaps I'll try 4.1.2....

I'm using 4.1.2 because I couldn't get 4.2 to build for armeb with
either OABI or EABI, though that was about 8-9 months ago. I'm using
OABI with 4.1.2 successfully (I don't think EABI builds though).

What is your target hardware?

gcc-3.1 is old; you might be able to get away with 3.3 but 4.x would be
much better (and you'll have more chance of getting assistance from the
community).

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
