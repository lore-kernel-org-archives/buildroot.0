From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Apr 2018 14:56:13 +0200
Subject: [Buildroot] [PATCH v1] valgrind: bump version to 3.13.0
In-Reply-To: <20180415202241.13595-1-ps.report@gmx.net>
References: <20180415202241.13595-1-ps.report@gmx.net>
Message-ID: <20180416145613.5d8d7fb9@windsurf.numericable.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 15 Apr 2018 22:22:41 +0200, Peter Seiderer wrote:
> - update site
> - remove 0004-Fixes-for-musl-libc.patch (applied upstream, see [1])
> 
> [1] https://sourceware.org/git/?p=valgrind.git;a=commit;h=f8f1e9cb434cc97ce16586437407a6ac7e6a74a7
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

You're removing the only patch that was touching configure.ac, so I
believe AUTORECONF = YES is no longer necessary in valgrind.mk. Do you
confirm ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
