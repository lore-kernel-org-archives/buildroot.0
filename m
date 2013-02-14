From: Will Moore <will.moore@beraninstruments.com>
Date: Thu, 14 Feb 2013 09:53:38 -0000
Subject: [Buildroot] Buildroot at ELC: review/suggestions needed
In-Reply-To: <20130213231346.0ed68b45@skate>
References: <20130209195709.323b9f5e@skate> <20130213231346.0ed68b45@skate>
Message-ID: <63C31970879140E7839D65DDAADF4076@beraninstruments.com.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] On
> Behalf Of Thomas Petazzoni
> Sent: 13 February 2013 22:14
> 
> Hello,
> 
> On Sat, 9 Feb 2013 19:57:09 +0100, Thomas Petazzoni wrote:
> 
> >  * Give me suggestions on what to demonstrate. I will prepare a
> >    slideshow of 10-20 slides that continuously loops (it should
> >    present the main characteristics and features of Buildroot), but I
> >    also would like to have some demo to show (I can bring an ARM board
> >    if needed). Any suggestions, both for the slideshow and the demo?
> 
> The current state of the slides is visible at
> http://free-electrons.com/~thomas/pub/buildroot-slides.pdf.
> 
> The two slides about build time and system size are still empty, I'm
> currently making the experiments to get the numbers.

Looks good, some small suggestions that might improve them:

Slide 3/11 replace "product makers" with "product manufacturers"?
Slide 6/11 replace "Allows to significantly improve Buildroot quality, by" with
"Allows significant improvement of Buildroot quality by"?
Slide 7/11 I appreciate this is a list of packages but is it clear that
Buildroot can build you a toolchain?  I might also expect to see bootloaders,
Linux, busybox earlier in the list as the starting point of almost all Buildroot
usage with the more important packages later in the list, but I appreciate what
is "important" is personal...
Slide 8/11 replace "weights about" with "weighs in at approximately".
Slide 11/11 it might be better to show a more interesting page of the user
manual.

HTH


Will

> 
> Best regards,
> 
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
