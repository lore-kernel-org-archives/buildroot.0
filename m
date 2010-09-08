From: Paul Jones <paul@pauljones.id.au>
Date: Wed, 8 Sep 2010 16:34:48 +1000
Subject: [Buildroot] AVR32 kernel install bug
In-Reply-To: <20100908082010.7a27de42@surf>
References: <op.vinvdkgksev97k@joachim-lappis>
	<20100907150948.4de996e3@surf><op.viny90lpsev97k@joachim-lappis>
	<20100907165650.7cf10d65@surf><1283923886.18866.7.camel@joachim-laptop>
	<20100908082010.7a27de42@surf>
Message-ID: <020001cb4f1f$f01e01f0$d05a05d0$@pauljones.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-
> bounces at busybox.net] On Behalf Of Thomas Petazzoni
> Sent: Wednesday, 8 September 2010 4:20 PM
> To: buildroot at busybox.net
> Subject: Re: [Buildroot] AVR32 kernel install bug
> 
> Hello,
> 
> On Wed, 08 Sep 2010 07:31:26 +0200
> Joachim Pihl <joachim.pihl@sensordevelopments.com> wrote:
> 
> > Again, I really can't remember, I had my mind focused elsewhere...
> > For a test, I set up a virtual machine for linux (with virtualbox). I
> > am not doing that again, it is _dead slow_. Building Buildroot takes
> > ~2 hours - on an i7!
> 
> Yes, in a virtual machine, it is very slow. On a machine such as an i7, it
should
> be relatively quick, it really depends on the number of packages you
> enabled.

Also if you can use vmware using direct disk access (no virtual disk) speeds
things up considerably. Using a Q9400 I can build a toolchain + qt in around
25 mins.


Paul.
 
