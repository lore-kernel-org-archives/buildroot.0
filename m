From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Jan 2018 15:03:57 +0100
Subject: [Buildroot] [PATCH] package/linux-firmware: fix incorrect
 line-continuation
In-Reply-To: <20180113222429.21497-1-yann.morin.1998@free.fr>
References: <20180113222429.21497-1-yann.morin.1998@free.fr>
Message-ID: <20180114150357.18e4406f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 13 Jan 2018 23:24:29 +0100, Yann E. MORIN wrote:
> Partially fixes:
>     https://gitlab.com/buildroot.org/buildroot/-/jobs/47806089
> 
> And add myself to the list of devloppers for it.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  DEVELOPERS                               | 1 +
>  package/linux-firmware/linux-firmware.mk | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
