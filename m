From: Microbit_P43000 <microbit@virginbroadband.com.au>
Date: Thu, 22 Apr 2010 02:07:10 +1000
Subject: [Buildroot] Still can't build working
	rootfswith	crosstool-NGtoolchain
In-Reply-To: <hqn0op$14i$1@dough.gmane.org>
References: <hqhq8e$uau$1@dough.gmane.org><8D63FCBEC4B04D56B92C74260683A038@development><028801cae0e3$3ebe5720$bc3b0560$@com><5D7DDABC417D46CFACF64003BB0EBC2F@development>
	<hqn0op$14i$1@dough.gmane.org>
Message-ID: <82069254E03F44CB90EDB741DB18CBF9@development>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Grant,

That puts my soul at rest a bit... &:). Wish I posted this many months ago, oh well...
I have a copy of the 'dl' dir, re-extract BR, re-copy the dl directory contents and
re-import
my configs for everything and make. 
At one stage the whole cycle took ~ 1 hour 15 mins. Common sense had to prevail I guess -
it's just a lot faster than chasing ghosts - it seems that your experience matches the
observations I made.

Being unfamiliar with BR as I was, naturally one always doubts themselves first.
I really wanted to know wtf exactly was going on. Never have, never will - I guess.

Shame, although I really like buildroot, it is/was extremely irritating.
(It used to be much worse for me when I started, then BR still supported "multiple
projects", that I just
_never_ got a handle on. Things would go ape frequently, a rebuild of one project would 
- guess what - ...trigger a "complete rebuild" of the internal toolchain after making a
subsequent small change in the other project - It seems it was a good idea to do away with
that, blah)

But I learned heaps in the process. So something constructive after all - BR2 still is my
favourite so far. I like its flexibility !!

Best Regards,
Kris 


> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] On Behalf Of
> Grant Edwards
> Sent: Thursday, 22 April 2010 12:06 AM
> To: buildroot at uclibc.org
> Subject: Re: [Buildroot] Still can't build working rootfswith crosstool-NGtoolchain
> 
> On 2010-04-21, Microbit_P43000 <microbit@virginbroadband.com.au> wrote:
> 
> > It's a while ago I've been through this - but the common denominator
> > of course is the fact that the lib is dynamically linked. The config
> > of float/lib is just fine - it compiles on a fresh install - or
> > consequent builds for my rootfs, Nano runs perfect - no problemo.
> >
> > I just couldn't pin down _what_ exactly triggers BR2 to "remake"
> > itself completely. It mostly would happen *after* I change a simple
> > option in Busybox - of all things. How exactly does that warrant
> > RE-building the whole install (incl internal toolchain) ???
> 
> I never do anything with buildroot other than complete ground-up
> builds from scratch.  Despite the documented ways to do partial
> rebuilds, I was never able to reliably do a parial rebuild.  After
> several instances of spending hours or days chasing problems that went
> away after a complete re-build, I simply gave up on doing anything
> other than building from zero.
> 
> --
> Grant Edwards               grant.b.edwards        Yow! Where do your SOCKS
>                                   at               go when you lose them in
>                               gmail.com            th' WASHER?
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
