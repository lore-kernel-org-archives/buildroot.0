From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Mar 2015 11:59:06 +0100
Subject: [Buildroot] [PATCH v9] wine: New package
In-Reply-To: <54ECDDE1.3040507@dawncrow.de>
References: <54ECDDE1.3040507@dawncrow.de>
Message-ID: <20150304115906.547fb949@free-electrons.com>
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

This package is causing some build failures in our autobuilders, see
http://autobuild.buildroot.org/results/018/018391c5e70d33bc0b5745ad7a2a273efa9be0d7/build-end.log.

Config to reproduce:
http://autobuild.buildroot.org/results/018/018391c5e70d33bc0b5745ad7a2a273efa9be0d7/config.

Can you have a look and submit a patch to fix this build problem?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
