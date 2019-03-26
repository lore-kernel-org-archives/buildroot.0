From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Mar 2019 14:53:57 +0100
Subject: [Buildroot] [PATCH v2 0/4] toolchain-external: add OpenMP
 support
In-Reply-To: <20190326123032.9905-1-ed.blake@sondrel.com>
References: <20190326123032.9905-1-ed.blake@sondrel.com>
Message-ID: <20190326145357.780dfbef@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ed,

On Tue, 26 Mar 2019 12:30:44 +0000
Ed Blake <ed.blake@sondrel.com> wrote:

> Ed Blake (4):
>   toolchain-external: introduce BR2_TOOLCHAIN_HAS_OPENMP
>   package/gcc: select BR2_TOOLCHAIN_HAS_OPENMP if BR2_GCC_ENABLE_OPENMP
>   toolchain-external: enable OpenMP for supporting toolchains
>   package: use BR2_TOOLCHAIN_HAS_OPENMP

Thanks, this looks good to me overall, but I didn't receive PATCH 2/4,
and patchwork didn't receive it as well. Do you know what happened with PATCH 2/4 ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
