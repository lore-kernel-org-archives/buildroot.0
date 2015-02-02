From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Feb 2015 21:19:54 +0100
Subject: [Buildroot] [PATCH 0/4] ARM Cortex-M3 support
In-Reply-To: <1421951608-31233-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1421951608-31233-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <20150202211954.54557b27@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ezequiel Garcia,

On Thu, 22 Jan 2015 15:33:24 -0300, Ezequiel Garcia wrote:

> Guido Mart?nez (3):
>   arm: conditionally support regular ARM instructions
>   arm: update processor types
>   toolchain: allow for stupid toolchains
> 
> Thomas Petazzoni (1):
>   toolchain-external: add OSELAS 2013.12.2 Cortex-M3 toolchain

So as I said, PATCH 1/4 applied. Several comments have been made on the
other patches. Can you respin a new iteration for these?

In the mean time, I'll mark those three patches as 'Changes Requested'
in patchwork, so please remember to send a new version.

Also, if you could send at least one defconfig for a Cortex-M3 board,
it would be good.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
