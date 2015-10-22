From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 22 Oct 2015 17:55:54 +0200
Subject: [Buildroot] [PATCH 1/1] configs/xilfpga: Add xilfpga defconfig
In-Reply-To: <5628F0AD.3090906@mind.be>
References: <1445439476-32911-1-git-send-email-Zubair.Kakakhel@imgtec.com>
 <20151021171402.5d9aa7d0@free-electrons.com>
 <5628ABC9.50300@imgtec.com> <5628F0AD.3090906@mind.be>
Message-ID: <20151022175554.2befc190@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Zubair,

On Thu, 22 Oct 2015 16:20:29 +0200, Arnout Vandecappelle wrote:

>  If those patches are all that is needed, it would be possible to include them
> in buildroot. Or download them from patchwork. We're really not going to accept
> a defconfig that doesn't build a kernel.

We could indeed just do:

BR2_LINUX_KERNEL_PATCH="https://patchwork.linux-mips.org/patch/11324/mbox/ https://patchwork.linux-mips.org/patch/11325/mbox/ https://patchwork.linux-mips.org/patch/11327/mbox/ https://patchwork.linux-mips.org/patch/11326/mbox/"

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
