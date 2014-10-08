From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Oct 2014 18:43:14 +0200
Subject: [Buildroot] Review of FOSDEM 2014 meeting action points
In-Reply-To: <CANQCQpbFSvHF9Q+Yo59H5NMVR31-JdR69Aao64popVHCt3QsVQ@mail.gmail.com>
References: <20141008104845.495ad683@free-electrons.com>
 <CANQCQpbFSvHF9Q+Yo59H5NMVR31-JdR69Aao64popVHCt3QsVQ@mail.gmail.com>
Message-ID: <20141008184314.50830272@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matthew Weber,

On Wed, 8 Oct 2014 11:40:37 -0500, Matthew Weber wrote:

> >    - SELinux. Still not merged, but not really pushed actively
> >      anymore.
> 
> We are preparing an updated SELinux patch set and hope to have it
> submitted in the Nov-Dec time frame (finally got some funding to
> finish this work).  For this time around, we've been doing some extra
> testing in hopes the merge doesn't break things to badly.  There are a
> number of RFC items that we'll be posting in the weeks to come
> (covering documentation, defconfig examples, handing target skeleton
> changes, etc.)

Great. SELinux is definitely interesting, but it's also a big thing,
with lots of packages with scary build systems that do not handle
cross-compilation very well. So it'll take a bit of time to review and
get merged. But we'll work with you to get this done.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
