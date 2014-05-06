From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 May 2014 11:12:52 +0200
Subject: [Buildroot] [PATCHv2 10/10] toolchain-external: add publicly
 available musl toolchains
In-Reply-To: <87fvkngw1s.fsf@dell.be.48ers.dk>
References: <1399324630-3830-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1399324630-3830-11-git-send-email-thomas.petazzoni@free-electrons.com>
 <87fvkngw1s.fsf@dell.be.48ers.dk>
Message-ID: <20140506111252.4d02b027@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Tue, 06 May 2014 10:18:07 +0200, Peter Korsgaard wrote:

>  > +	default "powerpc-linux-musl-gcc" if BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS && BR2_powerpc
> 
> The '-gcc' part shouldn't be there.

Dammit, of course. There were so many variants that I couldn't test
them all.

> Committed with that fixed, thanks.
> 
> Tested with arm-versatile / ppc-g3beige / mipsel-malta / x86 qemu
> defconfigs.

Great, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
