From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Aug 2015 15:35:06 +0200
Subject: [Buildroot] elf2flt .ARM.exidx and .ARM.extab section handling
In-Reply-To: <180102384.TlRWI16dqe@raillard-dv6>
References: <1990856.EDz1xKh0BM@raillard-dv6>
 <20150828115314.606c5049@free-electrons.com>
 <180102384.TlRWI16dqe@raillard-dv6>
Message-ID: <20150828153506.3567c225@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Douglas RAILLARD,

On Fri, 28 Aug 2015 15:15:34 +0200, Douglas RAILLARD wrote:

> > Also, can you ask on the nommu.org mailing list
> > (http://lists.nommu.org/listinfo/nommu) is they have a new official
> > upstream location for elf2flt ?
> 
> Sure

In the mean time, Waldemar pointed to his own Git tree of elf2flt.
Still, it would be great to have some kind of "official" upstream place
for elf2flt development.


> I'll study these sources, as they should handle correctly the .ARM.exidx and 
> .ARM.extab sections, thanks for the pointer.
> Caveat: From https://github.com/jserv/stm32f429-linux-builder:
> SourceryG++ arm-2011.03 is known to NOT work (but elf2flt is probably still 
> useable).

You can find all other versions, including sources, at
http://sourcery.mentor.com/public/gnu_toolchain/.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
