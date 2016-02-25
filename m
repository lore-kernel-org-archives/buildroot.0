From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Feb 2016 21:36:08 +0100
Subject: [Buildroot] [PATCH 1/1] uboot-tools: add option for dumpimage
In-Reply-To: <1456409941-10295-1-git-send-email-paulo.zaneti@datacom.ind.br>
References: <1456409941-10295-1-git-send-email-paulo.zaneti@datacom.ind.br>
Message-ID: <20160225213608.4c5ecc35@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Paulo Zaneti,

On Thu, 25 Feb 2016 11:19:01 -0300, Paulo Zaneti wrote:
> The tool dumpimage extracts data from U-Boot images.
> U-Boot added dumpimage tool on release 2014.01.
> This commit allows installation on target and host.
> 
> Signed-off-by: Paulo Zaneti <paulo.zaneti@datacom.ind.br>
> ---
>  package/uboot-tools/Config.in      | 6 ++++++
>  package/uboot-tools/uboot-tools.mk | 8 ++++++++
>  2 files changed, 14 insertions(+)

Applied to next, thanks.

It is somewhat odd that the host variant gets installed in usr/bin, and
the target variant in usr/sbin, but it's already the case for the other
U-Boot tools. So if we want to improve this, it can be done as a
separate patch.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
