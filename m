From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Fri, 31 Oct 2008 08:54:59 -0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/pciutils
In-Reply-To: <20081031103023.GH26468@mx.loc>
References: <20081031040328.19ABB3C784@busybox.net>
	<20081031103023.GH26468@mx.loc>
Message-ID: <d6cda7730810310354g280c9ffbyd720dba75f965138@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Oct 31, 2008 at 8:30 AM, Bernhard Reutner-Fischer
<rep.dot.nop@gmail.com> wrote:
> On Thu, Oct 30, 2008 at 09:03:28PM -0700, correa at uclibc.org wrote:
>>Author: correa
>>Date: 2008-10-30 21:03:27 -0700 (Thu, 30 Oct 2008)
>>New Revision: 23876
>>
>>Log:
>>Fix bug #0005884 - pciutils depends on zlib
>
> This is not correct.

Patches welcome.

Four words mails are not as much helpfull as they might seam. What
exactly is not correct? It looks pretty much correct:
http://git.kernel.org/?p=utils/pciutils/pciutils.git;a=blob;f=Makefile;h=bc163db5431c64d5d506944c5c98430a175049b5;hb=166bfe87b328908be0b1b7c7196410a1cfb1d8ea

Unless we add a patch that has no hope of ever going away or provide
the author with better build solutions. Neither of those I'm willing
to do for a package that I have no use for.

Either way, building without zlib, althougth possible, cripples
pciutils in not being able to use compressed PCI ID databases.

Kind Regards,
    Thiago A. Correa
