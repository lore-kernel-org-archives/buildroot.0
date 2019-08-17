From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 17 Aug 2019 15:42:43 +0200
Subject: [Buildroot] [PATCH next 2/2] package/strace: reenable bpf for
 m68k
In-Reply-To: <593878c6ee43b76681b2da5c32fa067a983fe3af.1565927678.git.baruch@tkos.co.il>
References: <2dbcdf78584fc5d00cc68a5582510af74ed0588a.1565927678.git.baruch@tkos.co.il>
 <593878c6ee43b76681b2da5c32fa067a983fe3af.1565927678.git.baruch@tkos.co.il>
Message-ID: <20190817154243.16fa1e2e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Baruch,

On Fri, 16 Aug 2019 06:54:38 +0300
Baruch Siach <baruch@tkos.co.il> wrote:

> Kernel commit 0472301a28f ("bpf: fix uapi bpf_prog_info fields
> alignment") fixed the issue causing build failure in bpf support code.
> The fix has been applied to all kernel versions that are affected and
> supported (v4.19, v5.1, v5.2). Enable back bpf for m68k.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> Note: the binary toolchain based on 2019.05.1 is still affected

The kernel headers version used in 2019.05.1 are not recent enough ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
