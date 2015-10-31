From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 31 Oct 2015 18:26:13 +0100
Subject: [Buildroot] [PATCH 4/4] package/dvblast: fix musl build
In-Reply-To: <a138be83167445a8f88e8b028725cf6a48d45b37.1446219805.git.yann.morin.1998@free.fr>
References: <cover.1446219805.git.yann.morin.1998@free.fr>
 <a138be83167445a8f88e8b028725cf6a48d45b37.1446219805.git.yann.morin.1998@free.fr>
Message-ID: <20151031182613.5f6c818a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri, 30 Oct 2015 16:43:43 +0100, Yann E. MORIN wrote:
> Fix integer types: use intXX_t, not u_intXX_t.

This is a bit terse as a commit log, so I've expanded the explanations
a bit.

> diff --git a/package/dvblast/0002-fix-int-types.patch b/package/dvblast/0002-fix-int-types.patch
> new file mode 100644
> index 0000000..0324f39
> --- /dev/null
> +++ b/package/dvblast/0002-fix-int-types.patch
> @@ -0,0 +1,22 @@
> +Integer types are uintXX_t not u_intXX_t

Same here.

Also, please submit the patch upstream.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
