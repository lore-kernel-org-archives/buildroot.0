From: Dallas Clement <dallas.a.clement@gmail.com>
Date: Fri, 6 Jun 2014 11:14:15 -0500
Subject: [Buildroot] autoconf caching
In-Reply-To: <20140606091548.53f07f90@free-electrons.com>
References: <CAE9DZUT8+z0NF5O6sh=y4svCfQW0bh1Zt4r7OM9fe9nYvk-O0w@mail.gmail.com>
 <20140605224222.0184a9b7@free-electrons.com>
 <CAE9DZURmNL1iOcY4UR4CrDkg5DOT46-yy-e1+Ftax1_W0faing@mail.gmail.com>
 <20140606091548.53f07f90@free-electrons.com>
Message-ID: <CAE9DZURp2teR8p5WP3OQEZyZ71qD=8U97q03cRd0yHbTsz8FwA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jun 6, 2014 at 2:15 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Dallas Clement,
>
> On Thu, 5 Jun 2014 17:06:48 -0500, Dallas Clement wrote:
>
> > You bet.  Please see attached.  I'm in the process of fully upgrading
> over
> > to latest buildroot / master from 2012.08 so there is probably still some
> > deprecated stuff in my .config.
>
> There is another thing that strikes out in your configuration: there
> are many packages that we don't have in Buildroot, and that don't seem
> to be specific to your company or project. What about submitting your
> new packages upstream?
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>

Hi Thomas.  Thanks very much for looking at my configuration.  I think you
certainly nailed it.
I have a lot of packages, and perl and mysql especially are taking a long
time.  My build recipes
for both of these are a year or two out of date.  In fact, my perl recipe
is still using qemu to build
instead of perl cross.  Hopefully updating this recipe will help some,
though as you pointed out
it is still using MAKE1.

> Seems a fairly decent setup. You have enough RAM, and a good storage
> system (ideally based on SSDs) ?

Yep, very speedy SSDs and 64 GB for RAM.  Because of all the serialization
in this build process,
building from a large ram disk seems to make little difference.

> There is another thing that strikes out in your configuration: there
> are many packages that we don't have in Buildroot, and that don't seem
> to be specific to your company or project. What about submitting your
> new packages upstream?

Yes, I can certainly do that.  There's a lot here.  Much of it is obscure.
Please let me know which ones you are most
interested in.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140606/8122b93f/attachment.html>
