From: Robert P. J. Day <rpjday@crashcourse.ca>
Date: Mon, 4 Aug 2008 09:02:57 -0400 (EDT)
Subject: [Buildroot] Why linux26-modules before linux26
In-Reply-To: <20080804130121.GB27672@mx.loc>
References: <1217651676.6280.11.camel@kokopelli>
	<20080804130121.GB27672@mx.loc>
Message-ID: <alpine.LFD.1.10.0808040901350.7693@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 4 Aug 2008, Bernhard Fischer wrote:

> On Fri, Aug 01, 2008 at 09:34:36PM -0700, Brian Beattie wrote:
> >I have a kernel that does not want to compile the modules before
> >the rest of the kernel.  I've worked around that, but it does raise
> >a question that maybe somebody knows the answer to, why are the
> >makefiles set to compile the kernel-modules so early compared to
> >the rest of the kernel?
>
> This was added by Steven, IIRC. I don't see a reason why the modules
> are built before the kernel.
>
> Steven, can you please explain?

why should it make a difference?  shouldn't kernel modules be
buildable independently from the kernel proper?  AFAIK, all that's
required of the kernel tree is to do the equivalent of "make
modules_prepare", no?

rday
--

========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry:
    Have classroom, will lecture.

http://crashcourse.ca                          Waterloo, Ontario, CANADA
========================================================================
