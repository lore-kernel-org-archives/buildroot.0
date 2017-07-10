From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Jul 2017 18:04:58 +0200
Subject: [Buildroot] [PATCH 1/4 v3] arch/arm: fix -mcpu default values
 for AArch64
In-Reply-To: <cbd726c5aa26ea8278c518508ba76efc5b796f7a.1499592591.git.yann.morin.1998@free.fr>
References: <cover.1499592591.git.yann.morin.1998@free.fr>
 <cbd726c5aa26ea8278c518508ba76efc5b796f7a.1499592591.git.yann.morin.1998@free.fr>
Message-ID: <20170710180458.7ff45d1c@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  9 Jul 2017 11:29:58 +0200, Yann E. MORIN wrote:
> We have to specify the -mcpu value, even in 64-bit mode.
> 
> For AArch64, +fp and +simd are the default, so they are totally useless.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Baruch Siach <baruch@tkos.co.il>
> 
> ---
> Changes v1 -> v2:
>   - squash the two changes into one patch  (Thomas)
>   - remove useless parentheses  (Baruch)
>   - remove superfluous indentation

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
