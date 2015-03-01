From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 Mar 2015 13:12:24 +0100
Subject: [Buildroot] [PATCH v9] wine: New package
In-Reply-To: <54ECDDE1.3040507@dawncrow.de>
References: <54ECDDE1.3040507@dawncrow.de>
Message-ID: <20150301131224.60a193ea@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Andr? Hentschel,

On Tue, 24 Feb 2015 21:24:01 +0100, Andr? Hentschel wrote:
> Adds new package: wine
> 
>   Wine is a compatibility layer capable of running Windows applications on Linux.
> 
> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> [Only build-tested, not run-time tested y lack of Windows apps]
> Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

I've applied this patch to the next branch, after fixing some minor
typos and rewording a bit the comment about the external toolchain
prefix issue.

Thanks a lot Andr?, and thanks to Yann for the testing and Acked-by!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
