From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Dec 2015 11:56:51 +0100
Subject: [Buildroot] [PATCH] openocd: bump to 0.9.0
In-Reply-To: <CAGm1_ks+db-1cASJWweJ6B2LHBa+zNfzj1V2+aQvdhFYbT=UOQ@mail.gmail.com>
References: <1448959942-22748-1-git-send-email-yegorslists@googlemail.com>
 <20151201095826.GC2193@tarshish>
 <CAGm1_ks+db-1cASJWweJ6B2LHBa+zNfzj1V2+aQvdhFYbT=UOQ@mail.gmail.com>
Message-ID: <20151201115651.0f1d7b34@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yegor Yefremov,

On Tue, 1 Dec 2015 11:33:25 +0100, Yegor Yefremov wrote:

> Commit message states: Pass -std=gnu99, needed to build with a basic toolchain.
> 
> I've commented this like and could successfully compile with musl +
> gcc 4.9.3 and also with Linaro ARM 2015.08 (GCC 5.x).
> 
> @Thomas and @Claudio: any idea, what configuration produced compiling issues?

Can you try with
http://autobuild.buildroot.org/toolchains/configs/br-arm-basic.config ?
This is what I call a "basic" toolchain, i.e a minimal uClibc toolchain
with no wchar and al. enabled.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
