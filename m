From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 00:31:26 +0200
Subject: [Buildroot] [PATCH 6/6] qemu: add support for vde2
In-Reply-To: <1462348079-7631-6-git-send-email-simonn.maes@gmail.com>
References: <1462348079-7631-1-git-send-email-simonn.maes@gmail.com>
 <1462348079-7631-6-git-send-email-simonn.maes@gmail.com>
Message-ID: <20160704003126.6a107311@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  4 May 2016 09:47:59 +0200, Simon Maes wrote:
> Additional configuration for qemu package:
> - Enable VDE2 support for qemu
> 
> Signed-off-by: Simon Maes <simonn.maes@gmail.com>
> ---
>  package/qemu/Config.in.host | 8 ++++++++
>  package/qemu/qemu.mk        | 5 +++++
>  2 files changed, 13 insertions(+)

I also did a respin of this patch, in a very similar way. See
http://patchwork.ozlabs.org/patch/643850/.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
