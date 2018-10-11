From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Oct 2018 09:34:01 +0200
Subject: [Buildroot] [PATCH] glibc: fix build breakage
In-Reply-To: <20181011062348.22396-1-yegorslists@googlemail.com>
References: <20181011062348.22396-1-yegorslists@googlemail.com>
Message-ID: <20181011093401.2f9d4af6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 11 Oct 2018 08:23:48 +0200, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> On platforms with soft floating point glibc produces a compile time
> warning (maybe-uninitialized) that will be regarded as an error.
> 
> Add upstream patch fixing this issue.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  ...soft-fp-ignore-maybe-uninitialized-w.patch | 88 +++++++++++++++++++
>  1 file changed, 88 insertions(+)
>  create mode 100644 package/glibc/glibc-2.28-18-g2339d6a55eb7a7e040ae888e906adc49eeb59eab/0001-sysdeps-ieee754-soft-fp-ignore-maybe-uninitialized-w.patch

I've applied, but after tweaking the commit title to make it a bit more
specific. "fix build breakage" is indeed very fuzzy.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
