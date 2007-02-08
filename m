From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 8 Feb 2007 18:40:07 +0100
Subject: [Buildroot] building ARM toolchain with nofpu
In-Reply-To: <200702081833.53780.yann.morin.1998@anciens.enib.fr>
References: <c88e466f0701311609u4896b81ehb99cb2eb01f78886@mail.gmail.com>
	<200702072124.30009.yann.morin.1998@anciens.enib.fr>
	<20070208172531.GB8945@aon.at>
	<200702081833.53780.yann.morin.1998@anciens.enib.fr>
Message-ID: <20070208174007.GA9196@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Feb 08, 2007 at 06:33:53PM +0100, Yann E. MORIN wrote:
>Bernhard,
>All,
>
>On Thursday 08 February 2007 182, Bernhard Fischer wrote:
>> It would be of tremendous help to have one non-float mmu-less config for
>> a kernel that i can check against qemu (i.e. run the resulting
>> filesystem and kernel via current qemu).
>> Does anybody have such a .config i could play with?
>
>I'm using a highly modified, soon-to-be-available version of crosstool to
>build my toolchains, not buildroot (except for vampirising its patches! :-) ).
>
>I can try with buildroot, and submit a patch if I succeed. More later (I'm
>kind of busy right now with a BluePAD tablet PC and my crosstool).
>
>The problem lies more with gcc than with uClibc or binutils or the kernel
>headers.

I was talking about a kernel .config and a hint on what arm variant qemu
supports (nick-name plus cpu name like "dominator" arm0815xyz).
