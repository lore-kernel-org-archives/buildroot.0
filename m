From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Apr 2018 23:37:30 +0200
Subject: [Buildroot] [PATCH v3 2/6] zstd: add host libzstd support
In-Reply-To: <20180416193953.19924-2-ps.report@gmx.net>
References: <20180416193953.19924-1-ps.report@gmx.net>
 <20180416193953.19924-2-ps.report@gmx.net>
Message-ID: <20180425233730.78bf5c21@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 16 Apr 2018 21:39:49 +0200, Peter Seiderer wrote:
> For the host only the libzstd library is built (no
> need for host-lz4 host-xz host-zlib dependencies
> because they affect only the cmdline tool).
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v2 -> v3:
>   - fix trailing spaces
>   - clarify the no need for host-lz4 host-xz host-zlib dependency
>     (suggested by Yann E. MORIN)

I've applied, after changing the build command to use -C $(@D)/lib, as
suggested by Yann E. Morin (and verifying that it does work).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
