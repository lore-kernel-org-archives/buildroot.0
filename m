From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 28 Aug 2015 17:02:03 +0200
Subject: [Buildroot] elf2flt .ARM.exidx and .ARM.extab section handling
In-Reply-To: <20150828153506.3567c225@free-electrons.com>
References: <1990856.EDz1xKh0BM@raillard-dv6>
 <20150828115314.606c5049@free-electrons.com>
 <180102384.TlRWI16dqe@raillard-dv6>
 <20150828153506.3567c225@free-electrons.com>
Message-ID: <20150828150203.GB2808@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thomas Petazzoni wrote,

> Dear Douglas RAILLARD,
> 
> On Fri, 28 Aug 2015 15:15:34 +0200, Douglas RAILLARD wrote:
> 
> > > Also, can you ask on the nommu.org mailing list
> > > (http://lists.nommu.org/listinfo/nommu) is they have a new official
> > > upstream location for elf2flt ?
> > 
> > Sure
> 
> In the mean time, Waldemar pointed to his own Git tree of elf2flt.
> Still, it would be great to have some kind of "official" upstream place
> for elf2flt development.
 
I think elf2flt from my GIT is the best you get ;)
The official CVS repository from uclinux project is down since
years. The uclinux project maintainer told me following:
http://mailman.uclinux.org/pipermail/uclinux-dev/2014-August/052560.html

No ETA.

As uClibc-ng is the only C library I know of, which is using BFLT,
it belongs to uClibc-ng and I will maintain it.

nommu.org focus is to use musl C library for at the moment sh2
target, which will _not_ use BFLT. It will use ELF with static PIE.
See here about some notes from Rich Felker:
http://www.openwall.com/lists/musl/2015/08/26/1
 
best regards
 Waldemar
