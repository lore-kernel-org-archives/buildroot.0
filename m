From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Thu, 8 Feb 2007 18:33:53 +0100
Subject: [Buildroot] building ARM toolchain with nofpu
In-Reply-To: <20070208172531.GB8945@aon.at>
References: <c88e466f0701311609u4896b81ehb99cb2eb01f78886@mail.gmail.com>
	<200702072124.30009.yann.morin.1998@anciens.enib.fr>
	<20070208172531.GB8945@aon.at>
Message-ID: <200702081833.53780.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard,
All,

On Thursday 08 February 2007 182, Bernhard Fischer wrote:
> It would be of tremendous help to have one non-float mmu-less config for
> a kernel that i can check against qemu (i.e. run the resulting
> filesystem and kernel via current qemu).
> Does anybody have such a .config i could play with?

I'm using a highly modified, soon-to-be-available version of crosstool to
build my toolchains, not buildroot (except for vampirising its patches! :-) ).

I can try with buildroot, and submit a patch if I succeed. More later (I'm
kind of busy right now with a BluePAD tablet PC and my crosstool).

The problem lies more with gcc than with uClibc or binutils or the kernel
headers.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< ?_? >==-- ?------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
?------------------------------?-------?------------------?--------------------?
