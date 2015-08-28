From: Douglas RAILLARD <public.douglas.raillard@gmail.com>
Date: Fri, 28 Aug 2015 17:27:10 +0200
Subject: [Buildroot] elf2flt .ARM.exidx and .ARM.extab section handling
In-Reply-To: <20150828150203.GB2808@waldemar-brodkorb.de>
References: <1990856.EDz1xKh0BM@raillard-dv6>
 <20150828153506.3567c225@free-electrons.com>
 <20150828150203.GB2808@waldemar-brodkorb.de>
Message-ID: <8200580.aRsvryMkeN@raillard-dv6>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Waldemar,

On Friday 28 August 2015 17:02:03, Waldemar Brodkorb wrote:
> As uClibc-ng is the only C library I know of, which is using BFLT,
> it belongs to uClibc-ng and I will maintain it.
So maybe the best solution is just to fix the build of elf2flt in buildroot 
and switch to Waldemar repo as upstream for buildroot's elf2flt ?

> nommu.org focus is to use musl C library for at the moment sh2
> target, which will _not_ use BFLT. It will use ELF with static PIE.
> See here about some notes from Rich Felker:
> http://www.openwall.com/lists/musl/2015/08/26/1

I've already asked on nommu.org mailing list, we'll see what comes out.

Best regards,

Douglas

-- 

Douglas RAILLARD
