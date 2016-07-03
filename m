From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 00:25:46 +0200
Subject: [Buildroot] [PATCH 1/6] qemu: add support for host-qemu-system
In-Reply-To: <1462348079-7631-1-git-send-email-simonn.maes@gmail.com>
References: <1462348079-7631-1-git-send-email-simonn.maes@gmail.com>
Message-ID: <20160704002546.6671a78b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  4 May 2016 09:47:54 +0200, Simon Maes wrote:
>     Additional package configurations are:
>     - Enable system or linux user-land emulation
>     - Enable SDL frontend and FDT support
>     - Enable Qemu debug
>     - Disable stripped binary format
> 
> Signed-off-by: Simon Maes <simonn.maes@gmail.com>

I just respined a new version of this patch, which takes into account
Arnout comments, and more. See:

   https://patchwork.ozlabs.org/patch/643849/

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
