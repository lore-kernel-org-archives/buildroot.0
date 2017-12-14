From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Dec 2017 15:19:08 +0100
Subject: [Buildroot] [PATCH 1/2] DTPMOD mod fix for musl's rcrt0
In-Reply-To: <20171214105706.4577-1-aep@exys.org>
References: <20171214105706.4577-1-aep@exys.org>
Message-ID: <20171214151908.4468ba56@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for your contribution!

On Thu, 14 Dec 2017 11:57:05 +0100, Arvid E. Picciani wrote:
> See https://github.com/rust-lang/rust/issues/46566
> 
> Signed-off-by: Arvid E. Picciani <aep@exys.org>
> ---
>  package/musl/0002-fix-rcrt1.o.patch | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 package/musl/0002-fix-rcrt1.o.patch
> 
> diff --git a/package/musl/0002-fix-rcrt1.o.patch b/package/musl/0002-fix-rcrt1.o.patch
> new file mode 100644
> index 0000000000..3dae65569f
> --- /dev/null
> +++ b/package/musl/0002-fix-rcrt1.o.patch

All patches need a description and a Signed-off-by. Also is this patch
in upstream musl? Has it been submitted?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
